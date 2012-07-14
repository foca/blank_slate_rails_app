//= require jquery
//= require rails
//= require underscore
//= require backbone
//= require backbone.marionette
//= require_tree ../templates

Backbone.Marionette.Renderer.render = function(template, data) {
    if (!JST[template]) throw "Template '" + template + "' not found!";
    return JST[template](data);
}

BlankSlate = {}
