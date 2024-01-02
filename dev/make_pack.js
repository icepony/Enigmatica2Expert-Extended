/* eslint-disable node/prefer-global/process */
/**
 * @file Make necessary preparations to turn dev version of pack
 * into distributable one.
 * Actually its:
 *  1. Clear temporary folders and files from previous script lunch
 *  2. Creating and replacing .zip files of latest tag
 *  3. Replacing files in dedicated server folder
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

// @ts-check

import { join, parse, relative, resolve } from 'node:path'

import boxen from 'boxen'
import chalk from 'chalk'
import * as del from 'del'
import fast_glob from 'fast-glob'
import fs_extra from 'fs-extra'
import git_describe from 'git-describe'
import ignore from 'ignore'
import logUpdate from 'log-update'
import open from 'open'
import replace_in_file from 'replace-in-file'
import simpleGit from 'simple-git'
import Client from 'ssh2-sftp-client'
import terminal_kit from 'terminal-kit'
import yargs from 'yargs'

import {
  end,
  execSyncInherit,
  loadJson,
  saveObjAsJson,
  saveText,
  write,
} from './lib/utils.js'

const { gitDescribeSync } = git_describe
const { terminal: term } = terminal_kit
const { rmSync, mkdirSync, existsSync, renameSync, readFileSync, writeFileSync, lstatSync }
  = fs_extra
const git = simpleGit()

const { sync: _globs } = fast_glob

/**
 * Globs with default options `dot: true, onlyFiles: false`
 * @param {string | string[]} source
 * @param {import('../node_modules/fast-glob/out/settings').Options} [options]
 */
function globs(source, options) {
  return _globs(source, { dot: true, onlyFiles: false, ...options })
}

/**
 * @param {any} ignored
 */
function getIgnoredFiles(ignored) {
  return globs(
    ignored._rules.filter(r => !r.negative).map(r => r.pattern),
    { ignore: ignored._rules.filter(r => r.negative).map(r => r.pattern) }
  )
}

/**
 * @param {string | readonly string[]} files list of globs of files to remove
 */
function removeFiles(files) {
  const removed = del.deleteSync(files, { dryRun: false })
  return `removed: ${removed.length}\n${
    removed.map(s => chalk.gray(relative(process.cwd(), s))).join('\n')
  }`
}

const argv = yargs(process.argv.slice(2))
  .alias('h', 'help')
  .option('dryRun', {
    alias   : 'd',
    type    : 'boolean',
    describe: 'Not create .zip files',
  })
  .option('old', {
    alias   : 'o',
    type    : 'boolean',
    describe: 'Do not clear previous files in TMP folder, and not clone',
  })
  .parseSync()

const style = {
  trace : chalk.hex('#7b4618'),
  info  : chalk.hex('#915c27'),
  log   : chalk.hex('#ad8042'),
  label : chalk.hex('#bfab67'),
  string: chalk.hex('#bfc882'),
  number: chalk.hex('#a4b75c'),
  status: chalk.hex('#647332'),
  chose : chalk.hex('#3e4c22'),
  end   : chalk.hex('#2e401c'),
}

;(async () => {
  const mcClientPath = process.cwd()
  const sZPath = 'D:/Program Files/7-Zip/7z.exe'
  const distrDir = 'E:/YandexDisk/dev/mc/e2e-e/dist/'
  const serverRoot = resolve(mcClientPath, 'server/')
  const tmpDir = 'D:/mc_tmp/'
  const tmpOverrides = resolve(tmpDir, 'overrides/')

  /**
   * Write task in log and execute it
   * @param {string} s Name of the tast would be printed in Log
   * @param {()=>void} fn Function of task
   * @param {string} [cwd] Optional working path where task is executed
   */
  const doTask = (s, fn, cwd) => {
    const oldCwd = process.cwd()
    if (cwd) process.chdir(cwd)
    write(style.label(s))
    end(fn())
    if (cwd) process.chdir(oldCwd)
  }

  /*
 █████╗ ██╗   ██╗████████╗ ██████╗ ███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
███████║██║   ██║   ██║   ██║   ██║██╔████╔██║███████║   ██║   ██║██║   ██║██╔██╗ ██║
██╔══██║██║   ██║   ██║   ██║   ██║██║╚██╔╝██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
██║  ██║╚██████╔╝   ██║   ╚██████╔╝██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
*/
  write(`${chalk.gray('-'.repeat(20))}\n`)

  let STEP = 1

  /**
   * Prompt user to write something and press ENTER or ESC
   * @param {string} message message to show
   * @param {terminal_kit.Terminal.InputFieldOptions} [options] message to show
   * @returns {Promise<string|undefined>} inputted string or undefined
   */
  async function enterString(message, options) {
    const msg = `[${STEP++}] ${message}`
    term(style.trace(msg.replace(/(ENTER|ESC)/g, style.info('$1'))))
    const result = await term.inputField({
      cancelable: true,
      ...(options ?? {}),
    }).promise
    term('\n')
    return result
  }

  /**
   * Prompt user to press ENTER or ESC
   * @param {string} message message to show
   * @param {()=>Promise<boolean>} [condition] repeat until true
   * @returns {Promise<boolean>} `true` if ENTER pressed, `false` otherwise
   */
  const pressEnterOrEsc = async (message, condition) => {
    let oneTime = 0
    while (condition ? !(await condition()) : !oneTime++)
      if ((await enterString(message)) === undefined) return false

    return true
  }

  if (
    await pressEnterOrEsc(
      `Press ENTER to perform Automation. Press ESC to skip.`
    )
  ) {
    doTask('🪓 Doing automation ...\n\n', () =>
      execSyncInherit('esno mc-tools/packages/run/src/cli.ts "dev:(.*)"'))
  }

  /*
 ██████╗██╗  ██╗ █████╗ ███╗   ██╗ ██████╗ ███████╗██╗      ██████╗  ██████╗
██╔════╝██║  ██║██╔══██╗████╗  ██║██╔════╝ ██╔════╝██║     ██╔═══██╗██╔════╝
██║     ███████║███████║██╔██╗ ██║██║  ███╗█████╗  ██║     ██║   ██║██║  ███╗
██║     ██╔══██║██╔══██║██║╚██╗██║██║   ██║██╔══╝  ██║     ██║   ██║██║   ██║
╚██████╗██║  ██║██║  ██║██║ ╚████║╚██████╔╝███████╗███████╗╚██████╔╝╚██████╔╝
 ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚══════╝ ╚═════╝  ╚═════╝
*/

  const oldVersion = gitDescribeSync().tag || undefined

  const inputVersion = (
    await enterString(`Enter next version and press ENTER: `, {
      default: oldVersion,
    })
  )?.trim()
  const nextVersion = inputVersion || oldVersion || 'v???'
  const zipBaseName = `E2E-Extended-${nextVersion}`
  const serverSetupConfig = 'server/server-setup-config.yaml'

  if (await pressEnterOrEsc(`Generate Changelog? ENTER / ESC.`)) {
    const latestPath = 'CHANGELOG-latest.md'

    // Update version in files
    execSyncInherit(`npx json -I -f config/CustomMainMenu/mainmenu.json -e "this.labels.version_num.text='${nextVersion}'"`)
    writeFileSync('dev/version.txt', nextVersion)
    replace_in_file.sync({
      files: 'manifest.json',
      from : /(^ {2}"version"[\s\n]*:[\s\n]*")[^"]+("[\s\n]*,)/m,
      to   : `$1${nextVersion}$2`,
    })
    replace_in_file.sync({
      files: serverSetupConfig,
      from : /^( {2}modpackUrl\s*:\s*)(.+)$/m,
      to   : `$1https://github.com/Krutoy242/Enigmatica2Expert-Extended/releases/download/${nextVersion}/${zipBaseName}.zip`,
    })

    // Generate changelog
    execSyncInherit(`npx conventional-changelog-cli --config dev/tools/changelog/config.cjs -o ${latestPath}`)

    // Iconize
    execSyncInherit(`esno E:/dev/mc-icons/src/cli.ts "${latestPath}" --silent --no-short --modpack=e2ee --treshold=2`)

    await open(latestPath, { wait: true })
  }

  await pressEnterOrEsc(
    `Clear your working tree, rebase, and press ENTER. Press ESC to skip.`,
    async () => (await git.status()).isClean()
  )

  if (await pressEnterOrEsc(`Add tag? ENTER / ESC.`))
    execSyncInherit(`git tag -a -f -m "Next automated release" ${nextVersion}`)

  /*
██████╗ ██████╗ ███████╗██████╗ ███████╗██████╗  █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
██████╔╝██████╔╝█████╗  ██████╔╝█████╗  ██████╔╝███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
██╔═══╝ ██╔══██╗██╔══╝  ██╔═══╝ ██╔══╝  ██╔══██╗██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
██║     ██║  ██║███████╗██║     ███████╗██║  ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
*/

  const zipPath_base = join(distrDir, zipBaseName)
  const zipPath_EN = `${zipPath_base}.zip`
  const zipPath_server = `${zipPath_base}-server.zip`

  const isZipsExist = !argv.dryRun && [zipPath_EN, zipPath_server].some(f => existsSync(f))

  let rewriteOldZipFiles = false
  if (isZipsExist && (await pressEnterOrEsc(`Rewrite old .zip files? ENTER / ESC`))) {
    rewriteOldZipFiles = true
    doTask(
      '🪓 Removing old zip files ... ',
      () => del.deleteSync([zipPath_EN, zipPath_server], { force: true }).length
    )
  }
  const makeZips = !isZipsExist || rewriteOldZipFiles

  const devonlyIgnore = ignore().add(readFileSync('dev/.devonly.ignore', 'utf8'))

  if (!argv.old && makeZips) {
    doTask(`🪓 Clearing tmp folder ${tmpDir} ... `, () => {
      try {
        rmSync(tmpDir, { recursive: true })
      }
      catch (err) {}
      mkdirSync(tmpOverrides, { recursive: true })
    })

    doTask(`👬 Cloning latest tag to ${tmpOverrides} ... \n`, () => {
      execSyncInherit(`git clone --recurse-submodules -j8 --depth 1 "file://${mcClientPath}" .`)
    }, tmpOverrides)

    doTask(
      '⬅️ Move manifest.json ... ',
      () => {
        const manifest = loadJson('manifest.json')
        manifest.files.forEach(o => delete o.___name)
        saveObjAsJson(manifest, 'manifest.json')
        renameSync('manifest.json', '../manifest.json')
      },
      tmpOverrides
    )

    doTask(
      '🧹 Removing non-release files and folders ... ',
      () => removeFiles(getIgnoredFiles(devonlyIgnore)),
      tmpOverrides
    )
  }

  /*
███████╗██╗██████╗
╚══███╔╝██║██╔══██╗
  ███╔╝ ██║██████╔╝
 ███╔╝  ██║██╔═══╝
███████╗██║██║
╚══════╝╚═╝╚═╝
*/

  /**
   * Returns handler for working with Zip file of specified path
   * @param {string} zipPath path to file working with
   */
  function withZip(zipPath) {
    /**
     * Handler to work with zip file
     * @param {string | string[]} params Globs for files add or remove from Zip
     * @param {string} [command] Optional 7Zip command. Default 'a' - Add
     */
    const zipHandler = (params, command = 'a') => {
      if (argv.dryRun) {
        return write(
          `\n${command === 'd' ? '➖' : '➕'} ${
            `${chalk.bgRgb(10, 10, 10).rgb(30, 30, 30)(zipPath)
            } ${
            chalk.gray(params)}`
          }`
        )
      }

      const exec7z = p =>
        execSyncInherit(`"${sZPath}" ${command} -bso0 "${zipPath}" ${p}`)

      if (!Array.isArray(params)) return exec7z(params)

      const tmpPath = '_tmp_7zip.txt'
      saveText(params.join('\n'), tmpPath)
      exec7z(`@${tmpPath}`)
      del.deleteSync(tmpPath)
    }
    return zipHandler
  }

  makeZips && doTask('🏴󠁧󠁢󠁥󠁮󠁧󠁿 Create EN .zip ... \n', () => withZip(zipPath_EN)('.'), tmpDir)
  makeZips && doTask('📥 Create server zip ... \n', () => withZip(zipPath_server)('.'), serverRoot)

  /*
███████╗███████╗████████╗██████╗
██╔════╝██╔════╝╚══██╔══╝██╔══██╗
███████╗█████╗     ██║   ██████╔╝
╚════██║██╔══╝     ██║   ██╔═══╝
███████║██║        ██║   ██║
╚══════╝╚═╝        ╚═╝   ╚═╝
  */

  /**
   * @type {{ dir:string, label:string, config: {[key:string]:string} }[]}
   */
  const sftpConfigs = globs('secrets/sftp_servers/*/sftp.json').map((filename) => {
    const dir = parse(filename).dir
    return {
      dir,
      label : /** @type {string} */ (dir.split('/').pop()),
      config: loadJson(filename),
    }
  })

  // Relative to overrides
  const serverAllOverrides = globs('./*', { cwd: tmpOverrides })

  // Relative paths of dirs like [bansoukou, config, ...]
  const serverRemoveDirs = serverAllOverrides
    .filter(f => lstatSync(join(tmpOverrides, f)).isDirectory())
    .concat('mods')

  for (const conf of sftpConfigs) {
    logUpdate.done()

    if (!(await pressEnterOrEsc(
        `To upload SFTP ${style.string(conf.label)} press ENTER. Press ESC to skip.`
    )))
      continue

    const sftp = new Client()

    const updateBox = (/** @type {any[]} */ ...args) =>
      logUpdate(
        boxen(
          args.map((v, i) => Object.values(style)[i](String(v))).join(' '),
          {
            borderStyle: 'round',
            borderColor: '#22577a',
            width      : 50,
            padding    : { left: 1, right: 1 },
            title      : style.info(conf.label),
          }
        )
      )

    updateBox('Establishing connection')
    try {
      await sftp.connect(conf.config)
    }
    catch (error) {
      end('Cant connect to SFTP')
      continue
    }

    updateBox('Removing folders')
    await Promise.all(
      serverRemoveDirs.map(async (dir) => {
        try {
          if (!(await sftp.stat(dir)).isDirectory) return
          await sftp.rmdir(dir, true)
          updateBox('Removed folder:', dir)
        }
        catch (error) {}
      })
    )

    updateBox(`Copy ${serverSetupConfig}`)
    await sftp.fastPut(serverSetupConfig, serverSetupConfig)

    updateBox('Change and copy server overrides')
    replace_in_file.sync({
      files: join(conf.dir, 'overrides/config/mc2discord.toml'),
      from : /(start\s*=\s*")[^"]+"/,
      to   : `$1\`\`\`diff\\n+ Server Started! +\\n     ${nextVersion}\\n\`\`\`"`,
    })

    let fileCounter = 0
    sftp.on('upload', () => updateBox('Copy overrides', ++fileCounter))
    await sftp.uploadDir(join(conf.dir, 'overrides'), './')

    await sftp.end()
  }

  /*
  ██████╗ ███████╗██╗     ███████╗ █████╗ ███████╗███████╗
  ██╔══██╗██╔════╝██║     ██╔════╝██╔══██╗██╔════╝██╔════╝
  ██████╔╝█████╗  ██║     █████╗  ███████║███████╗█████╗
  ██╔══██╗██╔══╝  ██║     ██╔══╝  ██╔══██║╚════██║██╔══╝
  ██║  ██║███████╗███████╗███████╗██║  ██║███████║███████╗
  ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝
  */

  if (await pressEnterOrEsc(`Push tag? ENTER / ESC`))
    execSyncInherit('git push --follow-tags')

  const inputTitle = await enterString(
    `Enter release title and press ENTER. Press ESC to skip release: `
  )

  if (inputTitle !== undefined) {
    doTask('🌍 Releasing on Github ... \n', () =>
      execSyncInherit(
        'gh release create'
        + ` ${nextVersion}`
        + ` --title="${(`${nextVersion} ${inputTitle}`).trim()}"`
        + ' --repo=Krutoy242/Enigmatica2Expert-Extended'
        + ' --notes-file=CHANGELOG-latest.md'
        + ` "${zipPath_EN}"`
        + ` "${zipPath_server}"`
      ))
  }

  process.exit(0)
})()
