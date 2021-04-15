import axios from "axios";

const setEventListenerBuy = (modal, btn, ticketId) => {
    const button = document.querySelector("#buy-button");
    if (!button) return;
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
            let status = document.querySelector(`#ticketstatus-${ticketId}`)
            status.textContent = "Sold"
            btn.disabled = true
            if(response.status === 200) modal.toggle()
        })
        .catch((error) => {
            button.textContent = "Buy"
            console.log(error);
        });
    });
}

export default setEventListenerBuy