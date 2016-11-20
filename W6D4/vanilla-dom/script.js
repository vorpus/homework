document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  const addPlace = () => {
    event.preventDefault();
    const newPlace = document.getElementsByClassName("favorite-input")[0].value;
    console.log(newPlace);
    const liToAdd = document.createElement("li");
    // liToAdd.appendChild(document.createTextNode(newPlace));
    liToAdd.textContent = newPlace;
    document.getElementById("sf-places").appendChild(liToAdd);
  };
  // --- your code here!
  const favSubmit = document.getElementsByClassName("favorite-submit")[0];
  // debugger
  favSubmit.addEventListener("click", addPlace);



  // adding new photos
  const unhideForm = (e) => {
    event.preventDefault();
    const photoForm = document.getElementsByClassName("photo-form-container")[0];
    if (photoForm.className === "photo-form-container hidden") {
      photoForm.className = "photo-form-container";
    } else {
      photoForm.className = "photo-form-container hidden";
    }
  };

  const submitPhoto = (e) => {
    event.preventDefault();
    const imgUrl = document.getElementsByClassName("photo-url-input")[0].value;
    const liToAdd = document.createElement("li");
    const imgToAdd = document.createElement("img");
    imgToAdd.setAttribute("src", imgUrl);
    liToAdd.appendChild(imgToAdd);

    const dogPhotoList = document.getElementsByClassName("dog-photos")[0];
    dogPhotoList.appendChild(liToAdd);
  };

  // --- your code here!
  const showPhotoButton = document.getElementsByClassName("photo-show-button")[0];
  showPhotoButton.addEventListener("click", unhideForm);
  const photoButton = document.getElementsByClassName("photo-url-submit")[0];
  console.log(photoButton);
  photoButton.addEventListener("click", submitPhoto);

});
