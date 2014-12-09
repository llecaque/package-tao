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
    clean.taotesttakerbundle = ['output',  root + '/taoTestTaker/views/js/controllers.min.js'];
    
    /**
     * Compile tao files into a bundle 
     */
    requirejs.taotesttakerbundle = {
        options: {
            baseUrl : '../js',
            dir : 'output',
            mainConfigFile : './config/requirejs.build.js',
            paths : { 'taoTestTaker' : root + '/taoTestTaker/views/js' },
            modules : [{
                name: 'taoTestTaker/controller/routes',
                include : ext.getExtensionsControllers(['taoTestTaker']),
                exclude : ['mathJax', 'mediaElement'].concat(libs)
            }]
        }
    };

    /**
     * copy the bundles to the right place
     */
    copy.taotesttakerbundle = {
        files: [
            { src: ['output/taoTestTaker/controller/routes.js'],  dest: root + '/taoTestTaker/views/js/controllers.min.js' },
            { src: ['output/taoTestTaker/controller/routes.js.map'],  dest: root + '/taoTestTaker/views/js/controllers.min.js.map' }
        ]
    };

    grunt.config('clean', clean);
    grunt.config('requirejs', requirejs);
    grunt.config('copy', copy);

    // bundle task
    grunt.registerTask('taotesttakerbundle', ['clean:taotesttakerbundle', 'requirejs:taotesttakerbundle', 'copy:taotesttakerbundle']);
};
