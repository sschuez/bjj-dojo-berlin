console.log('Hello there');

const mySwitch = document.getElementById('customSwitch1');

mySwitch.addEventListener("click", (event) => {
	console.log(event);
	event.currentTarget.classList.toggle("active");
});

console.log(mySwitch);


