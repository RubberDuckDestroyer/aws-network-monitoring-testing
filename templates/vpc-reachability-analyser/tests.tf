resource "null_resource" "always_run" {
  triggers = {
    timestamp = "${timestamp()}"
  }
}

resource "aws_ec2_network_insights_analysis" "analysis" {
  network_insights_path_id = aws_ec2_network_insights_path.path.id

  wait_for_completion = true

  # This will always re-create the path
  lifecycle {
    replace_triggered_by = [
      null_resource.always_run
    ]
  }
}
