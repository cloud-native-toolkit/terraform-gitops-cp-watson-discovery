resource null_resource write_outputs {
  provisioner "local-exec" {
    command = "echo \"$${OUTPUT}\" > gitops-output.json"

    environment = {
      OUTPUT = jsonencode({
        name        = module.cp-watson-discovery.name
        inst_name   = module.cp-watson-discovery.inst_name
        sub_chart   = module.cp-watson-discovery.sub_chart
        sub_name   = module.cp-watson-discovery.sub_name 
        operator_namespace = module.cp-watson-discovery.operator_namespace
        cpd_namespace= module.cp-watson-discovery.cpd_namespace
        branch      = module.cp-watson-discovery.branch
        namespace   = module.cp-watson-discovery.namespace
        server_name = module.cp-watson-discovery.server_name
        layer       = module.cp-watson-discovery.layer
        layer_dir   = module.cp-watson-discovery.layer == "infrastructure" ? "1-infrastructure" : (module.cp-watson-discovery.layer == "services" ? "2-services" : "3-applications")
        type        = module.cp-watson-discovery.type
      })
    }
  }
}