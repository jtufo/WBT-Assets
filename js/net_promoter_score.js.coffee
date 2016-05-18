$ ->
  scoreSubmitted = false
  $(".nps-form-reason").slideUp(duration: 0)

  $("#new_net_promoter_score input:radio").on "click", ->
    $(".nps-form-question").slideUp()
    $(".nps-form-reason").slideDown()

  $("form#new_net_promoter_score").on "submit", ->
    if scoreSubmitted
      return false
    else
      scoreSubmitted = true
      $(".nps-response.error").slideUp("slow")
      $("#new_net_promoter_score input:submit").addClass("is-disabled")
      $("#net_promoter_score_reason").attr("readonly", true)
      $("#net_promoter_score_reason").addClass("is-disabled")

  $(".nps-exit").on "click", ->
    $(".ScalingForm--nps").slideUp("slow")
    $("#new_net_promoter_score").submit()

  $("#new_net_promoter_score").on "ajax:success", (data, status, xhr) ->
    if scoreSubmitted
      $(".nps-form-question, .nps-form, .rating-label").slideUp()
      $(".nps-response.success").slideDown()
      setTimeout ->
        $(".NetPromoter").slideUp("slow")
      , 3000
  .on "ajax:error", (xhr, status, error) ->
    $(".nps-response.error").slideDown("slow")
    scoreSubmitted = false
    $("#new_net_promoter_score input:submit").removeClass("is-disabled")
    $("#net_promoter_score_reason").attr("readonly", false)
    $("#net_promoter_score_reason").removeClass("is-disabled")
