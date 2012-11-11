var ProductList = Class.extend({
  init: function(options) {
    this.productQuantityAdjustmentUrl = options.productQuantityAdjustmentUrl;
    this.observeProductQuantityLabelClicks();
    this.observeProductQuantityInputBlurs();
    this.observeProductQuantityEnterPresses();
  },

  observeProductQuantityInputBlurs: function() {
    var self = this;
    $(".editable input").blur(function() {
      self.updateProductQuantity($(this));
    });
  },

  observeProductQuantityEnterPresses: function() {
    var self = this;
    $(".editable input").keypress(function(e) {
      if (e.which == 13) {
        self.updateProductQuantity($(this));
      }
    });
  },

  observeProductQuantityLabelClicks: function() {
    $(".quantity_label").click(function() {
      $(this).hide().siblings("input").show().focus();
      return false;
    });
  },

  updateProductQuantity: function(target) {
    var productId = target.parents("tr").attr("data-product-id");
    var newQuantity = target.val();
    var previousQuantity = target.parents("tr").attr("data-previous-quantity");
    var row = target.parents("tr");

    var request = $.ajax({
      url: this.productQuantityAdjustmentUrl,
      type: "POST",
      data: {
        product_quantity_adjustment: {
          product_id: productId,
          quantity: newQuantity - previousQuantity
        }
      },
      dataType: "json"
    });

    request.done(function(msg) {
      row.attr("data-previous-quantity", newQuantity);
      row.find(".quantity_label").html(newQuantity).show();
      row.find("input").hide();
    });
  }
});
