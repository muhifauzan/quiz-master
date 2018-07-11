import React from 'react'
import Quiz from './Quiz'

export const Quizzes = (props) => {
  let quizzes = props.quizzes.map((quiz) => {
    return(
      <div key={quiz.id}>
        <Quiz quiz={quiz} handleDelete={props.handleDelete} handleUpdate={props.handleUpdate} />
      </div>
    )
  })

  return (
    <div>
      {quizzes}
    </div>
  )
}
