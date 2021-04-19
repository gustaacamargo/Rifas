import axios from "axios";

document.addEventListener("turbolinks:load", () => {
    document.querySelectorAll(".raffle-action").forEach(button => {
        button.addEventListener("click", () => {
            button.textContent = "Loading...";
            const { url } = button.dataset;
            axios
            .get(url, {
                headers: {
                    Accept: "application/json",
                },
            })
            .then((response) => {
                console.log(response);
                button.className += " d-none"
            })
            .catch((error) => {
                alert(error.response.data.error)
                button.textContent = "Raffle"
                console.log(error);
            });
        })
    })
})