<template>
  <div id="app">
    <div v-for="(quiz, index) in quizez" v-show="index === questionindex">
      <!-- display the quiz Category -->
      <h1>{{ quiz.subcategory }}</h1>
      <h2>{{ quiz.question }}</h2>
      <!-- Responses: display a li for each possible response with a radio button -->
      <ol v-if="quiz.type ==='multiple'">
        <!--display the quiz options -->
        <li v-for="answer in quiz.pass_answers">
          <label>
            <!-- bind the options to the array index of the answers array that matches this index -->
            <input type="radio" name="answer" v-model="answers[index]" :value="answer"> {{answer}}
          </label>
        </li>
        <li v-for="answer in quiz.fail_answers">
          <label>
            <!-- bind the options to the array index of the answers array that matches this index -->
            <input type="radio" name="answer" v-model="answers[index]" :value="answer"> {{answer}}
          </label>
        </li>
      </ol>
      <span v-else-if="quiz.type ==='text'">
        <input type="text" name="answer" v-model="answers[index]" :value="answer">
      </span>
      <span v-else-if="quiz.type ==='date'">
        <input type="date" name="answer" v-model="answers[index]" :value="answer">
      </span>
      <span v-else-if="quiz.type ==='email'">
        <input type="email" name="answer" v-model="answers[index]" :value="answer">
      </span>
    </div>
    <!-- do not display if the question index exceeds the length of all quizez -->
    <div v-if="questionindex < quizez.length">
      <!-- display only if the question index is greater than zero -->
      <!-- onclick of this button, call the previous function, and show last question -->
      <button v-if="questionindex > 0" v-on:click="prev">
        prev
      </button>
      <!-- onclick of this button, call the next function, and show next question -->
      <button v-on:click="next">
        next
      </button>
    </div>
    <!-- show total score, if the questions are completed -->
    <span v-if="questionindex == quizez.length">Your Total score is {{score}} / {{quizez.length}}<br />
    <button v-on:click="save">
      save
    </button>
      </span>
  </div>
</template>


<script>
  // an array of questions to be asked. Length of 10 questions.
  import {error} from "vue";
  import Datastore from 'nedb';


  var quiz_questions = [
    {
      "category": "Background",
      "subcategory": "Background",
      "type": "text",
      "question": "Name"
    },
    {
      "category": "Background",
      "subcategory": "Background",
      "type": "email",
      "question": "Email"
    },
    {
      "category": "Background",
      "subcategory": "Background",
      "type": "date",
      "question": "Date"
    },
    {
      "category": "Shoulder",
      "subcategory": "Scratch Test",
      "type": "multiple",
      "question": "Pain or discomfort?",
      "pass_answers": ["Yes"],
      "fail_answers": ["No"]
    },
    {
      "category": "Shoulder",
      "subcategory": "Scratch Test",
      "type": "multiple",

      "question": "Fists within hands length (top hand right)?",
      "pass_answers": ["Yes"],
      "fail_answers": [
        "No",
        "No, but within one & a half hands lengths"
      ]
    }
  ];
  export default {
//name of the component
    name: 'app',
    //function that returns data to the components
    data : function (){
      return{
//question index, used to show the current question
        questionindex:0,
//set the variable quizez to the questions defined earlier
        quizez:quiz_questions,
//create an array of the length of the questions, and assign them to an empty value.
        answers:Array(quiz_questions.length).fill(''),
      }
    },
    //methods to be called in the component
    methods: {
      // Go to next question
      next: function() {
        this.questionindex++;
      },
      // Go to previous question
      prev: function() {
        this.questionindex--;
      },
      save: function () {

      }
    },
    computed:{
      //calculate total score of the quiz person.
      score: function() {
          window.alert(this.answers)


        var db = new Datastore({ filename: 'tmp/dataWhereAreYou.db', autoload: true  });

        var a = {
          name: this.answers[0],
          email: this.answers[1],
          date: this.answers[2]
        };

        db.insert(a, function(err, doc) {
          console.log('Inserted', doc.name, 'with ID', doc._id);
        });
        db.findOne({ twitter: '@ScottRobinson' }, function(err, doc) {
          console.log('Found user:', doc.name);
        });

//        var total = 0;
//        for (var i =0; i <this.answers.length; i++) {
//          for (var j = 0; j < this.quizez[i].fail_answers.length; j++)
//          {
//            if (this.quizez[i].category != 'Background' && this.answers[i] == this.quizez[i].fail_answers[j]) {
//              total += 1;
//            }
//          }
//        }
//        return total;
      }
    }
  }
</script>

<style>
  #app {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    margin-top: 60px;
  }
</style>
