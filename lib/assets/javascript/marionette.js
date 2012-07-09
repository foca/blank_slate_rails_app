define(["templates", "backbone.marionette"], function(JST, Marionette) {
    Marionette.Renderer.render = function(template, data) {
        if (!JST[template]) throw "Template '" + template + "' not found!";
        return JST[template](data);
    }

    return Marionette;
});
