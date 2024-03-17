/**
 * Replace all occurances of utils.rh() in files to Purge()
 */

import fast_glob from 'fast-glob'

import { getUnchangedFurnaceRecipes } from '../lib/tellme.js'
import { loadText, saveText } from '../lib/utils.js'

const furnUnchanged = getUnchangedFurnaceRecipes()
const furnOutputs = new Set(furnUnchanged.map(r => `${r.out_id}${r.out_meta ? `:${r.out_meta}` : ''}`))

const orePurged = new Set()
const ctlog = loadText('crafttweaker.log')
for (const { groups: { item } } of ctlog.matchAll(
  /^\[INITIALIZATION\]\[CLIENT\]\[INFO\] purging item <(?<item>[^>]+)> from oredict (?<name>.+)/gm
))
  orePurged.add(item)

for (const file of fast_glob.sync(['scripts/**/*.zs'], { dot: true })) {
  let text = loadText(file)
  let replaced = false
  text = text.replace(/utils[\s\n]*.[\s\n]*rh[\s\n]*\([\s\n]*<(?<item>[^>]+)>[\s\n]*\)[\s\n]*;/gm, (m, item) => {
    replaced =  true
    return [
      `Purge(<${item}>)`,
      furnOutputs.has(item) && '.furn()',
      orePurged.has(item) && '.ores()',
      ';',
    ].filter(Boolean).join('')
  })
  if (replaced) saveText(text, file)
}
