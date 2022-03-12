import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        // console.log(data); // called when data is broadcast in the cable
        messagesContainer.insertAdjacentHTML('beforeend', data);
      }
    });
  }
}

export { initChatroomCable };

// import consumer from "./consumer";
// ALTERNATIVE
// const initChatroomCable = () => {
//   const messagesContainer = document.getElementById('messages');
//   if (messagesContainer) {
//     const id = messagesContainer.dataset.chatroomId;

//     consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
//       received(data) {
//         messagesContainer.insertAdjacentHTML('beforeend', data); // called when data is broadcast in the cable
//         messagesContainer.scrollIntoView({ behavior: 'smooth', block: 'end' })
//         const messageInput = document.getElementById('message_content')
//         messageInput.value = ''
//       }
//     });
//   }
// }



// export { initChatroomCable };
