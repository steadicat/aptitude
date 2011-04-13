#!/usr/bin/env coffee

STATIC = 'static'

fs = require 'fs'
sys = require 'sys'
path = require 'path'
develop = require './develop'

handlers =
    '.coffee': develop.compileCoffee
    '.haml': develop.compileHaml
    '.sass': develop.compileSass

extensions =
    '.coffee': '.js'
    '.haml': '.html'
    '.sass': '.css'

compile = () ->
    walk STATIC, skipDots, (err, file) ->
        return console.log err if err
        for ext, handler of handlers
            if path.extname(file) == ext
                console.log "Compiling #{file}"
                handler file, (err, content) ->
                    return console.log err if err
                    fs.writeFile develop.stripExt(file) + extensions[ext], content

minify = (file, callback) ->
    develop.exec "java -jar contrib/closure.jar --js #{file}", callback

### Helpers ###

each = (obj, callback) ->
    for k, v of obj
        callback(k, v)

DIR = 16877

isDir = (p, callback) ->
    fs.stat p, (err, stats) ->
        if err
            callback err
        else
            callback no, stats.mode == DIR

walk = (p, filters..., callback) ->
    fs.readdir p, (err, files) ->
        return callback(err) if err
        files.forEach (file) ->

            f = "#{p}/#{file}"
            isDir f, (err, isIt) ->
                return callback(err) if err

                # filters
                stop = false
                filters.forEach (filter) ->
                    if not stop and not filter(file, isIt) then stop = true

                if stop then return

                if isIt
                    walk f, filters..., callback
                else
                    callback no, f

startsWith = (str, sub) -> str.substring(0, sub.length) is sub
endsWith = (str, sub) -> str.substring(str.length-sub.length) is sub

# walk filters
skipDots = (file, isDir) -> not startsWith file, '.'
extension = (ext) ->
    (file, isDir) ->
        if isDir
            yes
        else
            path.extname(file) is ext

compile()