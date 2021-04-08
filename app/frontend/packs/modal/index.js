import axios from "axios"
import { Modal } from "bootstrap"

document.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll(".open-modal").forEach(button => {
        let ticketId = button.id.split(" ")[0].split("-")[1]
        let raffleId = button.id.split(" ")[1].split("-")[1]
        button.addEventListener("click", () => {
            axios.get(`/modal/${raffleId}/${ticketId}`).then(response => {
                document.querySelector("#modal-placeholder").innerHTML = response.data
    
                let myModal = new Modal(document.getElementById('exampleModal'), {
                    keyboard: false
                })
                myModal.show()
            })
        })
    })
})

