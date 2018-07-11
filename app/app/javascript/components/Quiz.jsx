import React from 'react'

export default class Quiz extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      editable: false
    }
    this.handleEdit = this.handleEdit.bind(this)
  }

  handleEdit() {
    if(this.state.editable) {
      let id = this.props.quiz.id
      let question = this.question.value
      let answer = this.answer.value
      let quiz = {id: id, question: question, answer: answer}

      this.props.handleUpdate(quiz)
    }

    this.setState({editable: !this.state.editable})
  }

  render(){
    let question = this.state.editable ? <input type='text' ref={input => this.question = input} defaultValue={this.props.quiz.question} />:<h3>{this.props.quiz.question}</h3>
    let answer = this.state.editable ? <input type='text' ref={input => this.answer = input} defaultValue={this.props.quiz.answer} />:<p>{this.props.quiz.answer}</p>

    return(
    <div>
      {question}
      {answer}
      <button onClick={() => this.handleEdit()}>{this.state.editable? 'Submit' : 'Edit'}</button>
      <button onClick={() => this.props.handleDelete(this.props.quiz.id)}>Delete</button>
    </div>
    )
  }
}
