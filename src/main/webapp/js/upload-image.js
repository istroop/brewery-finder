async function uploadFile(){

    const file = $("#file");
    const photo = file[0].files[0];

    const formData = new FormData();
    formData.append("file", photo);

    var csrf_token = $('meta[name="csrf-token"]').attr('content');
    formData.append("CSRF_TOKEN", csrf_token);

    const url = `/upload`;

    let response = await fetch(url, {method: 'POST', body: formData});

    console.log(response)
    file.val('');

}

$(document).ready(function () {
    const button = $("#uploadButton");
    button.click(uploadFile);
});