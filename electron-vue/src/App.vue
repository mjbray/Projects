<template>
  <div id="app">
    <questionaire
      :questions="questions">
    </questionaire>
    <form-questions
      :questions="questions">
    </form-questions>
  </div>
</template>

<script>
  import Questionaire from './components/Questionaire.vue'
//  import FormQuestions from './components/FormQuestions.vue'

  export default {

    components: {
      Questionaire
//      FormQuestions
    },

    data () {
      return {
//question index, used to show the current question
        questionindex:0,
//set the variable quizez to the questions defined earlier
        quizez:quiz_questions,
//create an array of the length of the questions, and assign them to an empty value.
        answers:Array(quiz_questions.length).fill('')
      }
    },

//    created () {
//      // assign the event handler `updateListings` to the `data-updated` event
//      store.on('data-updated', this.updateListings)
//    },

//    methods: {
//      // set the bookmarks and categories data properties to the new ones
//      // received from the store
//      updateListings (categories, bookmarks) {
//        this.categories = categories
//        this.bookmarks = bookmarks
//      },

//      setSelectedCategory (category) {
//        this.selectedCategory = category;
//      }

  }
</script>
