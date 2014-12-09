module.exports = function(grunt) { 

    var requirejs   = grunt.config('requirejs') || {};
    var clean       = grunt.config('clean') || {};
    var copy        = grunt.config('copy') || {};

    var root        = grunt.option('root');
    var libs        = grunt.option('mainlibs');
    var ext         = require(root + '/tao/views/build/tasks/helpers/extensions')(grunt, root);

    /**
     * Remove bundled and bundling files
     */
    clean.taocebundle = ['output',  root + '/wfAuthoring/views/js/controllers.min.js'];
    
    /**
     * Compile tao files into a bundle 
     */
    requirejs.taocebundle = {
        options: {
            baseUrl : '../js',
            dir : 'output',
            mainConfigFile : './config/requirejs.build.js',
            paths : { 'wfAuthoring' : root + '/wfAuthoring/views/js' },
            modules : [{
                name: 'wfAuthoring/controller/routes',
                include : ext.getExtensionsControllers(['wfAuthoring']),
                exclude : ['mathJax', 'mediaElement'].concat(libs)
            }]
        }
    };

    /**
     * copy the bundles to the right place
     */
    copy.taocebundle = {
        files: [
            { src: ['output/wfAuthoring/controller/routes.js'],  dest: root + '/wfAuthoring/views/js/controllers.min.js' },
            { src: ['output/wfAuthoring/controller/routes.js.map'],  dest: root + '/wfAuthoring/views/js/controllers.min.js.map' }
        ]
    };

    grunt.config('clean', clean);
    grunt.config('requirejs', requirejs);
    grunt.config('copy', copy);

    // bundle task
    grunt.registerTask('taocebundle', ['clean:taocebundle', 'requirejs:taocebundle', 'copy:taocebundle']);
};
