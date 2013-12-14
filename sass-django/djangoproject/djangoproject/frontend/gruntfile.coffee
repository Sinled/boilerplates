"use strict"

# # Globbing
# for performance reasons we're only matching one level down:
# 'test/spec/{,*/}*.js'
# use this if you want to recursively match all subfolders:
# 'test/spec/**/*.js'
module.exports = (grunt) ->

  # load all grunt tasks
  require("matchdep").filterDev("grunt-*").forEach grunt.loadNpmTasks

  # configurable paths
  yeomanConfig =
    app: "src"
    assests: "assests"
    templ: "templates"
    dist: "../static"
    docs: "../templates/frontend-docs"

  grunt.initConfig
    yeoman: yeomanConfig

    # watch and livereload
    watch:
      options:
        livereload: true

      coffee:
        files: ["<%= yeoman.app %>/scripts/{,*/}*.coffee"]
        tasks: [
          "coffee:dist"
          "concat:server"
        ]

      js:
        files: [
          # '.tmp/scripts/{,*/}*.js',
          '<%= yeoman.app %>/scripts/{,*/}*.js'
        ]
        tasks: ["concat:server"]

      sass:
        files: ["<%= yeoman.app %>/styles/{,*/}*.{scss,sass}"]
        tasks: [
          "sass:server"
          "autoprefixer"
          "copy:server"
        ]

      images:
        files: ["<%= yeoman.app %>/images/*", "<%= yeoman.app %>/fonts/*"]
        tasks: [
          "copy:images"
        ]

      # livereload:
      #   files: [
      #     "<%= yeoman.templ %>/*.html",
      #     "{.tmp,<%= yeoman.app %>}/styles/{,*/}*.css",
      #     # "{.tmp,<%= yeoman.app %>}/scripts/{,*/}*.js",
      #     "<%= yeoman.app %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}"
      #   ]
      # tasks: ["uglify:server"]


    # open selected browser
    open:
      options:
        port: 8005

      server:
        path: "http://localhost:<%= open.options.port %>"
        app: "Google Chrome Canary"


    # clean working direcotry
    clean:
      options:
        force: true

      dist:
        files: [
          dot: true
          src: [".tmp", "<%= yeoman.dist %>/*", "!<%= yeoman.dist %>/.git*"]
        ]

      docs:
        files: [
          dot: true
          src: ["<%= yeoman.docs %>/*"]
        ]


    jshint:
      options:
        jshintrc: ".jshintrc"
        force: true

      all: ["Gruntfile.js", "<%= yeoman.app %>/scripts/{,*/}*.js", "!<%= yeoman.app %>/scripts/vendor/*", "test/spec/{,*/}*.js"]

    coffee:
      dist:
        options:
          sourceMap: true
          # bare: true

        files: [
          expand: true
          cwd: "<%= yeoman.app %>/scripts"
          src: "{,*/}*.coffee"
          dest: ".tmp/scripts"
          ext: ".js"
        ]


    # compile sass with source maps
    sass:
      options:
        compass: true

      server:
        options:
          sourcemap: true
          trace: true
          style: "expanded"
          lineNumbers: true

        files: [{
          expand: true
          cwd: '<%= yeoman.app %>/styles'
          src: ['*.{scss,sass}']
          dest: '.tmp/styles'
          ext: '.css'
        }]

      dist:
        options:
          style: "compressed"

        files: "<%= sass.server.files %>"


    # notify messages
    notify:
      options:
        enabled: true
        max_jshint_notifications: 5

      dist:
        options:
          message: "Build complete"


    # beautify and minify code with uglify
    uglify:
      server:
        options:
          mangle: false

          compress:
            global_defs:
              DEBUG: true

          beautify: true
          # sourceMap: "<%= yeoman.dist %>/scripts/main.map"
          # sourceMapRoot: "<%= yeoman.app %>"
          # sourceMapIn: ".tmp/scripts/{,*/}*.map"

        files: "<%= uglify.dist.files %>"

      dist:
        options:
          report: "min"
          compress:
            global_defs:
              DEBUG: false

        files:
          "<%= yeoman.dist %>/scripts/main.js": [
            # '<%= yeoman.app %>/bower_components/requirejs/require.js'
            # '<%= yeoman.app %>/bower_components/underscore/underscore-min.js'
            # '<%= yeoman.app %>/bower_components/backbone/backbone-min.js'
            '.tmp/scripts/{,*/}*.js'
            '<%= yeoman.app %>/scripts/{,*/}*.js'
            # '.tmp/scripts/main.js',
            # '.tmp/scripts/models/{,*/}*.js',
            # '.tmp/scripts/views/{,*/}*.js',
            # '.tmp/scripts/collections/{,*/}*.js',
            # '.tmp/scripts/routers/{,*/}*.js',
          ]

    # concat js on grunt server
    concat:
      server:
        options:
          banner: "var DEBUG = true;\n\n"

        files: "<%= uglify.dist.files %>"

    imagemin:
      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.dist %>/images"
          src: "{,*/}*.{png,jpg,jpeg}"
          dest: "<%= yeoman.dist %>/images"
        ]

    svgmin:
      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.dist %>/images"
          src: "{,*/}*.svg"
          dest: "<%= yeoman.dist %>/images"
        ]

    # cssmin:
      # dist:
        # files:
          # '<%= yeoman.dist %>/styles/main.css': ['.tmp/styles/{,*/}*.css', '<%= yeoman.app %>/styles/{,*/}*.css']


    # copy files not handled in other tasks here
    copy:
      dist:
        files: [
          expand: true
          dot: true
          cwd: "<%= yeoman.app %>"
          dest: "<%= yeoman.dist %>"
          src: ["*.{ico,png,txt}", ".htaccess"]
        ,
          "<%= yeoman.dist %>/scripts/jquery.min.js": "<%= yeoman.app %>/bower_components/jquery/jquery.min.js"
        ]

      images:
        files: [
          expand: true
          dot: true
          cwd: "<%= yeoman.app %>"
          dest: "<%= yeoman.dist %>"
          src: ["images/{,*/}*.{png,jpg,jpeg,webp,gif,svg}", "fonts/*"]
        ]

      server:
        files: [
          expand: true
          dot: true
          cwd: ".tmp/styles"
          dest: "<%= yeoman.dist %>/styles"
          src: ["*.{css,map}"]
        ,
          expand: true
          cwd: ".tmp/images"
          dest: "<%= yeoman.dist %>/images"
          src: ["generated/*"]
        ]

      assests:
        files: [
          expand: true
          cwd: "<%= yeoman.assests %>"
          dest: "<%= yeoman.dist %>"
          src: ["{,*/}*.*"]
        ]


    #use autoprefixer for clean vendor prefixes
    autoprefixer:
      options:
        browsers: ['last 2 version']

      no_dest:
        src: '.tmp/styles/*.css'


    # run heavy tasks here concurrently
    concurrent:
      server: [
        "sass:server"
        "coffee"
      ]

      dist: [
        "coffee"
        "sass:dist"
      ]

    styleguide:
      dist:
        options:
          framework:
            name: "styledocco"

          name: "Project Style Guide"

          # template:
          #   include: [
          #       "plugin.css"
          #       "app.js"
          #   ]

        files:
          "<%= yeoman.docs %>/docs": "<%= yeoman.app %>/styles/**/*.{scss,sass}"


  # grunt tacks

  # $ grunt server
  grunt.registerTask "server", [
    "clean:dist"
    "concurrent:server"
    "concat:server"
    "autoprefixer"
    "copy"
    "watch"
  ]

  # $ grunt build
  grunt.registerTask "build", [
    "clean:dist"
    "concurrent:dist"
    "uglify:dist"
    "autoprefixer"
    "copy"
    "imagemin"
    "svgmin"
    "notify:dist"
  ]

  # $ grunt
  grunt.registerTask "default", ["jshint", "build"]

  # $ grunt view
  grunt.registerTask "view", ["open", "server"]

  # $ grunt docs
  grunt.registerTask "docs", ["clean:docs", "styleguide"]
