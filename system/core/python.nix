{
  pkgs,
  ...
}:

let
  my-python-packages =
    ps: with ps; [
      # Data Processing & Analysis:

      pyspark
      pandas
      matplotlib
      seaborn

      # Machine Learning & Deep Learning:

      torch
      transformers
      diffusers
      accelerate

      # Environment & Package Management:

      setuptools
      
      # Web Requests & APIs:

      requests
      
      # Interactive Computing & Notebooks:

      jupyter
      notebook
    ];
in
{
  environment.systemPackages = with pkgs; [
    (pkgs.python3.withPackages my-python-packages)
  ];
}
