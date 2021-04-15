import axios from "axios";

const setEventListenerBuy = (modal) => {
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
            if(response.status === 200) modal.toggle()
        })
        .catch((error) => {
            button.textContent = "Buy"
            console.log(error);
        });
    });
}

export default setEventListenerBuy