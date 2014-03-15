module.exports = (grunt) ->
  (require 'load-grunt-tasks') grunt

  grunt.initConfig
    clean:
      dist:
        files: [
          dot: true
          src: [
            '.tmp'
            'dist/*'
          ]
        ]
    bower:
      install:
        options:
          targetDir: 'dist/lib'
          layout: 'byType'
          install: true
          verbose: true
    copy:
      dist:
        files: [
          expand: true
          cwd: 'app/'
          src: [
            'manifest.json'
            '*.html'
            'styles/*.css'
            'images/*.png'
            '_locales/{,*/}*.json'
          ]
          dest: 'dist'
        ]
    coffee:
      compile:
        expand: true
        cwd: 'app/scripts/'
        src: ['*.coffee']
        dest: '.tmp/scripts/'
        ext: '.js'
    uglify:
      background:
        files: [
          expand: true
          cwd: '.tmp/scripts/'
          src: '*.js'
          dest: 'dist/scripts/'
          ext: '.min.js'
        ]
    compress:
      dist:
        options:
          archive: 'package/drone-notifier.zip'
        files: [
          expand: true
          cwd: 'dist/'
          src: ['**']
          dest: ''
        ]

  grunt.registerTask 'build', [
    'clean:dist'
    'bower:install'
    'copy:dist'
    'coffee:compile'
    'uglify:background'
  ]

  grunt.registerTask 'pack', [
    'compress:dist'
  ]
