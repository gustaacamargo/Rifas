import axios from "axios"
import { Modal } from "bootstrap"
import setEventListenerBuy from "../controllers/tickets/buy"

document.addEventListener("turbolinks:load", () => {
    document.querySelectorAll(".open-modal").forEach(button => {
        const { ticket, raffle } = button.dataset;
        button.addEventListener("click", () => {
            axios.get(`/modal/${raffle}/${ticket}`).then(response => {
                document.querySelector("#modal-placeholder").innerHTML = response.data
    
                let myModal = new Modal(document.getElementById('exampleModal'), {
                    keyboard: false
                })
                myModal.show()
                setTimeout(() => {
                    setEventListenerBuy(myModal, button, ticket)
                }, 750);
            })
        })
    })
})

