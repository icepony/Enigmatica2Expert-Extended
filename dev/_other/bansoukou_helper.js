/**
 * @file Fix bansoukou bug that makes unable to rename .jar files
 *
 * https://github.com/LoliKingdom/Bansoukou/issues/4
 */

import fse from 'fs-extra'
import { globSync } from 'glob'

const { renameSync, existsSync  } = fse

// Disable old files
globSync('mods/*-patched.jar').forEach((f) => {
  const unpatched = f.replace('-patched.jar', '')
  const from = `${unpatched}.jar`
  if (existsSync(from)) {
    renameSync(from, `${unpatched}.disabled`)
    console.log('disabled :>> ', from)
  }
})

// Restore accidentally disabled
// globSync('mods/*.jar.disabled').forEach((f) => {
//   const unpatched = f.replace('.jar.disabled', '')
//   const from = `${unpatched}-patched.jar`
//   if (!existsSync(from)) {
//     renameSync(f, `${unpatched}.jar`)
//     console.log('enabled :>> ', f)
//   }
// })
