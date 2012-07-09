requirejs.config({
    shim: {
        "templates": {
            deps:    ["handlebars.runtime"],
            exports: "JST"
        },
        "jquery": {
            deps:    [],
            exports: "jQuery"
        },
        "rails": ["jquery"],
        "underscore": {
            deps:    [],
            exports: "_"
        },
        "backbone": {
            deps:    ["underscore", "jquery"],
            exports: function(_, $) {
                _.noConflict();
                $.noConflict();
                return this.Backbone.noConflict();
            }
        }
    }
});
