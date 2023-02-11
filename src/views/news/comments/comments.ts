import { Comment } from '../../../comments/comments.service';

function renderCommentsBlock(comment: Comment) {
  return `
  <li id="${comment.id}" newsId="${comment.idNews}">
  Author: ${comment.author}
  <br>
  Message: ${comment.message}
</li>
  `;
}

export function CommentListView(comments: Comment[]) {
  let html = '';
  for (const comment of comments) {
    if (comment.idAnswer) {
      html += `<ul style="list-style: none; margin-left: 50px">`;
      const subComment = comments.find(
        (sub) => sub.idAnswer == comment.idAnswer,
      );
      html += `
              <li id="${subComment.id}" newsId="${subComment.idNews}">
        Author: ${subComment.author}
        <br>
        Message: ${subComment.message}
      </li>
      `;
      html += `</ul>`;
    } else {
      html += renderCommentsBlock(comment);
    }
  }
  return `<ul style="list-style: none">
  ${html}
  </ul>
`;
}
