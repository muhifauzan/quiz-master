import React from 'react'

export const NewQuiz = (props) => {
  let formFields = {}

  return (
    <div>
      <input ref={input => formFields.question = input} placeholder='Enter the question'/>
      <input ref={input => formFields.answer = input} placeholder='Enter the answer' />
      <button onClick={() => props.handleFormSubmit(formFields.question.value, formFields.answer.value)}>Submit</button>
    </div>
  )
}
