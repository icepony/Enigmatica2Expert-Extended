/**
 * @file Convert markdown file into CurseForge-compatible HTML
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

// @ts-check

import { existsSync, readFileSync, writeFileSync } from 'node:fs'
import { join, parse } from 'node:path'
import process from 'node:process'

import * as cheerio from 'cheerio'
import MarkdownIt from 'markdown-it'

const sourcePath = String(process.argv[2] || 'latest_release.md')
if (!existsSync(sourcePath)) throw new Error(`Provide correct file path: ${sourcePath}`)

const md = new MarkdownIt({ html: true })

const $ = cheerio.load(md.render(readFileSync(sourcePath, 'utf8')))

// 𝑪𝒐𝒏𝒗𝒆𝒓𝒕 𝒂𝒍𝒍 𝒊𝒕𝒆𝒎𝒔 𝒊𝒎𝒂𝒈𝒆𝒔 𝒊𝒏𝒕𝒐 𝒋𝒖𝒔𝒕 𝒕𝒆𝒙𝒕
$('img')
  .filter(function () {
    return !!this.attribs.src.match(/https:\/\/is\.gd\/.+/) && !!this.attribs.title
  })
  .each(function () {
    $(this).replaceWith(
      `<strong><span style="font-family: terminal, monaco, monospace;">📦[${$(
        this
      ).attr('title')}]</span></strong>`
    )
  })

// 𝑩𝒆𝒕𝒕𝒆𝒓 𝒉𝒆𝒂𝒅𝒆𝒓𝒔
$(':header').before('<br/>').after('<br/>')
$('h2').before('<br/><hr/>').after('<br/>')
// $('h3').before('<br/>').after('<br/>')
$('h3')
  .wrap('<span style="text-decoration: underline;">').contents().unwrap()
  .wrapInner('<strong>')
$('li p').contents().unwrap()
// $('sub').contents().unwrap()
$('sup').remove()
$('th')
  .wrapInner('<span style="font-size: 1.2rem">')
  .wrapInner('<strong>')

// CF cant parse colspan
for (const o of ['d', 'h']) {
  // Add table margin
  $(`t${o}`).prepend('&nbsp;').append('&nbsp;')

  for (let i = 1; i < 7; i++) {
    for (const w of ['row', 'col']) {
      const p = $(`t${o}[${w}span=${i}]`).removeAttr(`${w}span`)
      for (let j = 1; j < i; j++)
        p.before(`<t${o}></t${o}>`)
    }
  }
}

// Find all <code> elements and replace new lines with <br>
// Curse Forge cant in newlines inside code blocks
// $('code').each(function () {
//   const codeContent = $(this).html()
//   if (!codeContent) return
//   $(this).html(codeContent.replace(/\n/g, '<br/>\n').replace(/ /g, ' '))
// })

// Remove CF unsupported tags
$('details').replaceWith($('details').contents())

// Remove html and body tags
$('html').contents().unwrap()
$('body').replaceWith($('body').contents())
$('head').replaceWith($('head').contents())
$('nobr').contents().unwrap()

const source = parse(sourcePath)

const wholeText = $.html()
  // Remove newlines after <li>. Dont know why cheerio add them
  .replace(/<li>\s*<br.?>/g, '<li>')

writeFileSync(join(source.dir, `${source.name}.html`), wholeText)
