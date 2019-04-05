const checked = new Set()

window.addEventListener("load", function (event) {
    console.log("All resources finished loading!")
    let saved = window.localStorage.getItem('checked-' + signature)
    if (saved != null)
        for (id of saved.split(',')) {
            checked.add(id)
            document.getElementById(id).innerHTML = '✓'
        }
    })

function check(elem) {
    const id = elem.id
    if (checked.has(id)) {
        elem.innerHTML = '▢'
        checked.delete(id)
    } else {
        elem.innerHTML = '✓'
        checked.add(id)
    }
    window.localStorage.setItem('checked-' + signature, Array.from(checked.values()).join(','))
}