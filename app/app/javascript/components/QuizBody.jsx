import React from 'react'
import {NewQuiz} from './NewQuiz'
import {Quizzes} from './Quizzes'

export default class Body extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      quizzes: []
    }
    this.handleFormSubmit = this.handleFormSubmit.bind(this)
    this.addNewQuiz = this.addNewQuiz.bind(this)
    this.handleDelete = this.handleDelete.bind(this)
    this.deleteQuiz = this.deleteQuiz.bind(this)
    this.handleUpdate = this.handleUpdate.bind(this)
    this.updateQuiz = this.updateQuiz.bind(this)
  }

  handleFormSubmit(question, answer) {
    fetch('/api/v1/quizzes', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({quiz: {question: question, answer: answer}})
    })
      .then((response) => { return response.json() })
      .then((quiz) => { this.addNewQuiz(quiz) })
  }

  addNewQuiz(quiz) {
    this.setState({quizzes: this.state.quizzes.concat(quiz)})
  }

  handleDelete(id) {
    fetch(`/api/v1/quizzes/${id}`, {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json'
      }
    })
      .then((response) => { this.deleteQuiz(id) })
  }

  deleteQuiz(id) {
    let newQuizzes = this.state.quizzes.filter((quiz) => quiz.id !== id)

    this.setState({quizzes: newQuizzes})
  }

  handleUpdate(quiz) {
    fetch(`/api/v1/quizzes/${quiz.id}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({quiz: quiz})
    })
      .then((response) => { this.updateQuiz(quiz) })
  }

  updateQuiz(quiz) {
    let newQuizzes = this.state.quizzes.filter((q) => q.id !== quiz.id)

    newQuizzes.push(quiz)
    this.setState({quizzes: newQuizzes})
  }

  componentDidMount() {
    fetch('/api/v1/quizzes.json')
      .then((response) => { return response.json() })
      .then((data) => { this.setState({quizzes: data.messages}) });
  }

  render() {
    return (
      <div>
        <NewQuiz handleFormSubmit={this.handleFormSubmit} />
        <Quizzes quizzes={this.state.quizzes} handleDelete={this.handleDelete} handleUpdate={this.handleUpdate} />
      </div>
    )
  }
}
