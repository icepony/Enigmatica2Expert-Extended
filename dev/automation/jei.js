/**
 * @file Gather information about 'purged' items from crafttweaker.log
 * to add them into `jei/itemBlacklist.cfg`
 * Also, sorts and cleanup jei blacklist
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

// @ts-check

import process from 'node:process'

import { getPurged, getSubMetas } from '../lib/tellme.js'
import {
  config,
  defaultHelper,
  getCSV,
  injectInFile,
  naturalSort,
} from '../lib/utils.js'

export async function init(h = defaultHelper) {
  await h.begin('Get files')
  const jeiConfigPath = 'config/jei/itemBlacklist.cfg'
  const purged = new Set([...getPurged()].map((s) => {
    let [, source, meta] = s?.match(/<([^:]+:[^:]+)(:(\d+|\*))?>/) ?? []
    if (meta === ':*') meta = ''
    return source + (meta ?? ':0')
  }))

  /** @type {string[]} */
  const pure = []

  const modList = getCSV('config/tellme/mod-list-csv.csv')

  const itemsCsv = getCSV('config/tellme/items-csv.csv')
  const definitions = Object.fromEntries(itemsCsv.map(o => [o['Registry name'], true]))

  /** @type {string[]} */
  const merged = [...config(jeiConfigPath).advanced.itemBlacklist, ...purged]

  await h.begin('Looking for wildcarable')
  merged.forEach((s, i) => {
    const [source, name, meta, ...rest] = s.split(':')
    if (!meta || rest.length || meta !== '0') return
    const id = `${source}:${name}`
    if (getSubMetas(id).length > 1) return
    merged[i] = id
  })

  await h.begin(`Fixing blacklist with ${merged.length} entries`)
  merged.forEach((s, i) => {
    // If duplicate
    const next = merged.slice(i + 1)
    if (next.includes(s)) return

    // If wildcarded
    /** @type {string} */
    // @ts-expect-error undef
    const defMetaed = s.match(/([^:]+:[^:]+)[:;].+/)?.[1]
    if (defMetaed && merged.includes(defMetaed)) return

    // If definition doesnt exist
    const splitted = s.split(':')
    const mod = splitted[0]
    const def = splitted.slice(0, 2).join(':')
    if (mod !== 'fluid' && mod !== 'gas') {
      // If mod not exist
      if (!modList.some(m => m.ModID === mod)) return

      // Item not exist
      if (!definitions[def]) return
    }

    pure.push(s)
  })

  pure.sort(naturalSort)

  const injected = injectInFile(
    jeiConfigPath,
    '    S:itemBlacklist <',
    '     >',
    `\n${pure.map(s => `        ${s}`).join('\n')}\n`
  )

  await h.begin(`injected :>> ${injected[0].numMatches}`)

  h.result(
    `Purged / Manually Blacklisted: ${purged.size} / ${
      pure.length - purged.size
    }`
  )
}

if (
  import.meta.url === (await import('node:url')).pathToFileURL(process.argv[1]).href
)
  init()
