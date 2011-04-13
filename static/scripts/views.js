;(function() {

    var ApartmentView = Backbone.View.extend({

        events: {
        },

        template: $('#apartments .t'),

        initialize: function() {
            _.bindAll(this, 'render')
            this.model.bind('remove', this.remove)
            this.model.view = this
        },

        render: function() {
            this.$('.address').text(this.model.get('address'))
            return this
        },

        remove: function() {
            $(this.el).remove()
        }
    })

    window['ApartmentView'] = ApartmentView

})()