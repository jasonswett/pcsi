var ProductList = Class.extend({
  init: function(options) {
    this.productQuantityAdjustmentUrl = options.productQuantityAdjustmentUrl;
    this.observeProductQuantityLabelClicks();
    this.observeProductQuantityInputBlurs();
  },

  observeProductQuantityInputBlurs: function() {
    var self = this;
    $(".editable input").blur(function() {
      self.updateProductQuantity({
        productId: $(this).parents("tr").attr("data-product-id"),
        newQuantity: $(this).val(),
        previousQuantity: $(this).parents("tr").attr("data-previous-quantity"),
        row: $(this).parents("tr")
      });
    });
  },

  observeProductQuantityLabelClicks: function() {
    $(".quantity_label").click(function() {
      $(this).hide().siblings("input").show().focus();
      return false;
    });
  },

  updateProductQuantity: function(options) {
    var request = $.ajax({
      url: this.productQuantityAdjustmentUrl,
      type: "POST",
      data: {
        product_quantity_adjustment: {
          product_id: options.productId,
          quantity: options.newQuantity - options.previousQuantity
        }
      },
      dataType: "json"
    });

    request.done(function(msg) {
      options.row.attr("data-previous-quantity", options.newQuantity);
      options.row.find(".quantity_label").html(options.newQuantity).show();
      options.row.find("input").hide();
    });
  }
});
