import axios from "axios";

const formatDate = (dateInString) => {
	const date = new Date(dateInString);
	const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct',	'Nov', 'Dec'];
	return `${date.getDate()} ${months[date.getMonth()]} ${date.getHours()}:${date.getMinutes()}`
};

const showDateRaffle = (date) => {
    document.querySelector("#title-date-raffle").classList.remove("d-none")
    document.querySelector("#value-date-raffle").classList.remove("d-none")
    document.querySelector("#value-date-raffle").textContent = formatDate(date)
}

const showWinnersOfAwards = (arrayWithResult) => {
    document.querySelector("#head-awards").innerHTML += "<th>Winner</th><th>Winning ticket</th>" 
    arrayWithResult.map(result => {
        document.querySelector(`#body-awards-${result.id}`).innerHTML += `<td>${result.name}</td><td>${result.number}</td>`
    })
}

const hideColumnActionInTickets = () => {
    document.querySelectorAll(".head-action-awards").forEach(item => item.classList += " d-none")
    document.querySelectorAll(".body-action-awards").forEach(item => item.classList += " d-none")
}

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
                showDateRaffle(response.data[0].date_raffle)
                showWinnersOfAwards(response.data)
                hideColumnActionInTickets()
                button.className += " d-none"
            })
            .catch((error) => {
                if(error.response?.data?.error) alert(error.response.data.error)
                button.textContent = "Raffle"
                console.log(error);
            });
        })
    })
})