module.exports = (grunt)->
  grunt.initConfig
#file watcher (used mostly in development environment
    watch:
      jade:
        options:
          livereload: true
          spawn: false
        files:['src/public/**/*','src/views/**/*.jade']
      coffeeAll:
        options:
          livereload:true
        files:['src/assets/**/*.coffee']
        tasks:'newer:coffee:devAll'
      lib:
        options:
          livereload:true
        files:["src/assets/lib/**/*.js"]
        tasks:'newer:copy:lib'
#Coffeescript compilation
    coffee:
      devAll:
        files: [
          expand: true
          cwd: "src/assets"
          src: ["**/*.coffee"]
          dest: "src/public"
          ext: ".js"
        ]
#Copy instructions
    copy:
      lib:
        files:[
          expand:true
          cwd:'src/assets/'
          src:['lib/**']
          dest:'src/public/'
        ]
#Register task
  grunt.registerTask 'dev', ['copy:lib','coffee:devAll','watch']

  #enable plugins
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-newer'
  grunt.loadNpmTasks 'grunt-contrib-copy'