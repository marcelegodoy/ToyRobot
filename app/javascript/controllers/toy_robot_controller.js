import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tableCell"];

  connect() {
    this.updateTable();
  }

  updateTable() {
    this.tableCellTargets.forEach((cell) => (cell.innerHTML = ""));

    const x = this.data.get("x");
    const y = this.data.get("y");
    const facing = this.data.get("facing");

    const img = document.createElement("img");
    img.src = "/assets/robot.png";
    img.alt = "Robot";

    img.style.transform = `rotate(${getRotationAngle(facing)}deg)`;
    img.style.height = `40px`;
    img.style.width = `40px`;

    const cellId = `${x}-${y}`;
    const cell = this.tableCellTargets.find((cell) => cell.id === cellId);

    if (cell) {
      cell.appendChild(img);
    }
  }
}

function getRotationAngle(facing) {
  switch (facing) {
    case "south":
      return 180;
    case "east":
      return -90;
    case "north":
      return 0;
    case "west":
      return 90;
    default:
      return 0;
  }
}