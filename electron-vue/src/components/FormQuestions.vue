<template>
  <div id="app">
    <div class="panel panel-default">
      <h1 class="text-center">Basic Information</h1>
      <div class="panel-body">
        <vue-form-generator :schema="schema" :model="model" :options="formOptions"></vue-form-generator>
      </div>
    </div>

    <button v-on:click="next">
      next
    </button>
  </div>
</template>


<script>

  import VueFormGenerator from "vue-form-generator";
  import Vue from 'vue';

  Vue.use(VueFormGenerator);
  export default {
      name:'app',
    data () {
      return {

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
            validator: VueFormGenerator.validators.string
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
        },
        questionindex:0,
      }
    },
    //methods to be called in the component
    methods: {
      // Go to next question
      next: function() {
        this.questionindex++;
      }
    },
  }
  </script>

<style>
  html {
    font-family: Tahoma;
    font-size: 14px;
  }

  body {
    font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
  }

  pre {
    overflow: auto;
  }
  pre .string { color: #885800; }
  pre .number { color: blue; }
  pre .boolean { color: magenta; }
  pre .null { color: red; }
  pre .key { color: green; }

  h1 {
    text-align: center;
    font-size: 36px;
    margin-top: 20px;
    margin-bottom: 10px;
    font-weight: 500;
  }

  fieldset {
    border: 0;
  }

  .panel {
    margin-bottom: 20px;
    background-color: #fff;
    border: 1px solid transparent;
    border-radius: 4px;
    -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
    box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
    border-color: #ddd;
  }

  .panel-heading {
    color: #333;
    background-color: #f5f5f5;
    border-color: #ddd;

    padding: 10px 15px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
  }

  .panel-body {
    padding: 15px;
  }

  .field-checklist .wrapper {
    width: 100%;
  }
</style>
