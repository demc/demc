let totalCount = 0;
let totalCost = 0;

$("#total-count").text(totalCount);
$("#total-cost").text(totalCount);

$("#add-to-cart").click(function() {
  let name = $("#item-name").val();
  let imageUrl = $("#item-image").val();
  let cost = $("#item-cost").val();
  let count = $("#item-count").val();

  let nameTd = "<td>" + name + "</td>";
  let imgTag = '<img width="50" src="' + imageUrl + '">';
  let imgTags = "";

  totalCost = totalCost + count * cost;
  totalCount = totalCount + count;

  $("#total-count").text(totalCount);
  $("#total-cost").text(totalCost);

  for (let i = 0; i < count; i++) {
    imgTags += imgTag;
  }

  let imgTd = "<td>" + imgTags + "</td>";
  let countTd = "<td>" + count + "</td>";
  let costTd = "<td>" + count * cost + "</td>";

  $("#items").append("<tr>" + nameTd + imgTd + countTd + costTd + "</td>");

  $("#item-name").val("");
  $("#item-image").val("");
  $("#item-cost").val("");
  $("#item-count").val("");
});
