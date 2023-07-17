output "network_test_ec2_internet_status" {
    value = aws_ec2_network_insights_analysis.analysis.status
    description = "The status of the network analysis"
}

output "network_test_ec2_internet_path" {
    value = aws_ec2_network_insights_analysis.analysis.path_found
    description = "The source can reach the destination (bool) :"
}

output "network_test_ec2_internet_status_msg" {
    value = aws_ec2_network_insights_analysis.analysis.status_message
    description = "The status message of the network analysis (if failed)"
}

output "network_test_ec2_internet_explanation" {
    value = try(aws_ec2_network_insights_analysis.analysis.explanations[0].explanation_code, null)
    description = "The explanation of the network analysis failure"
}

