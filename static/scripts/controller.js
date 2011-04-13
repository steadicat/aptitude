;(function() {

    var Controller = Backbone.Controller.extend({
        routes: {
            '': 'home',
            '!/': 'home',
            '!/apartments': 'apartments'
        },

        home: function() {
            console.log('home')
        },

        apartments: function() {
            console.log('apartments')
        }
    })

    window['Controller'] = Controller

})()