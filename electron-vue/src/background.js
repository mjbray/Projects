/**
 * Created by Margaret on 6/25/17.
 */
var vm = new Vue({
  el: "#background",

  components: {
    "vue-form-generator": VueFormGenerator.component
  },

  methods: {
    prettyJSON: function(json) {
      if (json) {
        json = JSON.stringify(json, undefined, 4);
        json = json.replace(/&/g, '&').replace(/</g, '<').replace(/>/g, '>');
        return json.replace(/("(\\u[a-zA-Z0-9]{4}|\\[^u]|[^\\"])*"(\s*:)?|\b(true|false|null)\b|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?)/g, function(match) {
          var cls = 'number';
          if (/^"/.test(match)) {
            if (/:$/.test(match)) {
              cls = 'key';
            } else {
              cls = 'string';
            }
          } else if (/true|false/.test(match)) {
            cls = 'boolean';
          } else if (/null/.test(match)) {
            cls = 'null';
          }
          return '<span class="' + cls + '">' + match + '</span>';
        });
      }
    }
  },

  data: {
    model: {
      name: "",
      email: "",
      date: "",
    },
    schema: {
      fields: [{
        type: "input",
        inputType: "text",
        label: "Name",
        model: "name",
        placeholder: "Athlete's name",
        required: true,
        validator:
        VueFormGenerator.validators.string
      }, {
        type: "input",
        inputType: "email",
        label: "E-mail",
        model: "email",
        required: true,
        placeholder: "Athlete's e-mail address",
        validator: VueFormGenerator.validators.email
      }, {
        type: "input",
        inputType: "date",
        label: "Date",
        model: "MM/DD/YYYY",
        required: true,
        placeholder: "MM/DD/YYYY",
      }]
    },

    formOptions: {
      validateAfterLoad: true,
      validateAfterChanged: true
    }
  }
});
