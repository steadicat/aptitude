;(function() {

    var Apartment = Backbone.Model.extend({
        initialize: function() {
            console.log('creating apartment')
        },

        clear: function() {
            this.destroy()
            this.view.remove()
        }
    })

    var ApartmentCollection = Backbone.Collection.extend({
        model: Apartment,
        url: '/db/apartments'
    })

    window['Apartment'] = Apartment
    window['ApartmentCollection'] = ApartmentCollection

})()