/**
 * Replace all occurances of utils.rh() in files to Purge()
 */

import fast_glob from 'fast-glob'

import { loadText, saveText } from '../lib/utils.js'

const ctlog = loadText('crafttweaker.log')
const allItems = new Map<string, string[]>()
for (const { groups: { oreName, item } } of ctlog.matchAll(
  /Purged ore: (?<oreName>\w+) from: <(?<item>.+)>$/gm
))
  allItems.set(item, (allItems.get(item) ?? []).concat(oreName))

console.log('found entries: :>> ', allItems.size)

const rgxList = [...allItems.keys()].join('|')
const fixedList = new Set<string>()
const rgx = new RegExp(`Purge[\\s\n]*\\([\\s\n]*<(${rgxList})>[\\s\n]*\\)[.\n]*\\.[\\s\n]*ores[\\s\n]*\\([\\s\n]*\\)`, 'gmi')
for (const file of fast_glob.sync(['scripts/**/*.zs'], { dot: true })) {
  let text = loadText(file)
  let replaced = false
  text = text.replace(rgx, (whole, item) => {
    replaced =  true
    const oresList = allItems.get(item).map(o => `<ore:${o}>`).join(', ')
    fixedList.add(item)
    return whole.replace(/ores[\s\n]*\([\s\n]*\)/mi, `ores([${oresList}])`)
  })
  if (replaced) saveText(text, file)
}

for (const [item, oreNames] of allItems)
  if (!fixedList.has(item)) console.log('not replaced :>> ', item, oreNames)
