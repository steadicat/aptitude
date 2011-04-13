/* require "jquery" */
/* require "underscore" */
/* require "backbone" */
/* require "models" */
/* require "views" */
/* require "controller" */

;(function() {

    var apartments = new ApartmentCollection()
    var apt = apartments.create()
    apt.set({address: '50 St Stephen St'})

    var view = new ApartmentView({model: apt})
    $('#apartments').append(view.render().el)

    var controller = new Controller()
    Backbone.history.start()

})()