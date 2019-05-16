create_clock -period 10.000 -name CLUSTER_CLK [get_pins soc_domain_i/pulp_soc_i/i_clk_rst_gen/clk_mux_fll_cluster_i/bufgmux_i/O]
# set_false_path -through [get_pins soc_domain_i/*]
# set_false_path -through [get_pins safe_domain_i/*]

create_clock -period 10.000 -name IN_CLK [get_pins pad_frame_i/padinst_ref_clk/iobuf_i/O]
create_clock -period 1000.000 -name REF_CLK [get_pins pad_frame_i/i_bufgce/O]
create_clock -period 100.000 -name JTAG_CLK [get_pins pad_frame_i/padinst_jtag_tck/iobuf_i/O]
create_clock -period 50.000 -name SOC_CLK [get_pins soc_domain_i/pulp_soc_i/i_clk_rst_gen/clk_mux_fll_soc_i/bufgmux_i/O]
create_clock -period 20.000 -name PER_CLK [get_pins soc_domain_i/pulp_soc_i/i_clk_rst_gen/clk_mux_fll_per_i/bufgmux_i/O]

# create_generated_clock -name VCLK_SPI_MAS0 -source [get_pins pulp_chip_i/zynq_soc_clk_i] -divide_by 2 [get_pins pulp_chip_i/soc_domain_i/ulpsoc_i/spi_master0_clk_o]
# create_generated_clock -name VCLK_SPI_MAS1 -source [get_pins pulp_chip_i/zynq_soc_clk_i] -divide_by 2 [get_pins pulp_chip_i/soc_domain_i/ulpsoc_i/spi_master1_clk_o]
# create_generated_clock -name VCLK_AUDIO -source [get_pins pulp_chip_i/zynq_soc_clk_i] -divide_by 2 [get_pins pulp_chip_i/soc_domain_i/ulpsoc_i/i2s_sck_i]
# create_generated_clock -name VCLK_I2C0 -source [get_pins pulp_chip_i/zynq_soc_clk_i] -divide_by 2 [get_pins pulp_chip_i/soc_domain_i/ulpsoc_i/i2c0_scl_i]
# create_generated_clock -name VCLK_I2C1 -source [get_pins pulp_chip_i/zynq_soc_clk_i] -divide_by 2 [get_pins pulp_chip_i/soc_domain_i/ulpsoc_i/i2c1_scl_i]
# create_generated_clock -name VCLK_LVDS_TX -source [get_pins pulp_chip_i/zynq_soc_clk_i] -divide_by 2 [get_pins pulp_chip_i/soc_domain_i/ulpsoc_i/rf_tx_clk_o]

set_false_path -from [get_clocks IN_CLK] -to [get_clocks REF_CLK]
set_false_path -from [get_clocks IN_CLK] -to [get_clocks JTAG_CLK]
set_false_path -from [get_clocks IN_CLK] -to [get_clocks SOC_CLK]
set_false_path -from [get_clocks IN_CLK] -to [get_clocks PER_CLK]

set_false_path -from [get_clocks REF_CLK] -to [get_clocks IN_CLK]
set_false_path -from [get_clocks REF_CLK] -to [get_clocks JTAG_CLK]
set_false_path -from [get_clocks REF_CLK] -to [get_clocks SOC_CLK]
set_false_path -from [get_clocks REF_CLK] -to [get_clocks PER_CLK]

set_false_path -from [get_clocks JTAG_CLK] -to [get_clocks IN_CLK]
set_false_path -from [get_clocks JTAG_CLK] -to [get_clocks REF_CLK]
set_false_path -from [get_clocks JTAG_CLK] -to [get_clocks SOC_CLK]
set_false_path -from [get_clocks JTAG_CLK] -to [get_clocks PER_CLK]

set_false_path -from [get_clocks SOC_CLK] -to [get_clocks IN_CLK]
set_false_path -from [get_clocks SOC_CLK] -to [get_clocks REF_CLK]
set_false_path -from [get_clocks SOC_CLK] -to [get_clocks JTAG_CLK]
set_false_path -from [get_clocks SOC_CLK] -to [get_clocks PER_CLK]


set_false_path -from [get_clocks PER_CLK] -to [get_clocks IN_CLK]
set_false_path -from [get_clocks PER_CLK] -to [get_clocks REF_CLK]
set_false_path -from [get_clocks PER_CLK] -to [get_clocks JTAG_CLK]
set_false_path -from [get_clocks PER_CLK] -to [get_clocks SOC_CLK]

#####


set_property IOSTANDARD LVCMOS33 [get_ports cluster_jtag_tdo_o]
set_property IOSTANDARD LVCMOS33 [get_ports cluster_jtag_tms_i]
set_property IOSTANDARD LVCMOS33 [get_ports cluster_jtag_trst_ni]
set_property IOSTANDARD LVCMOS33 [get_ports cluster_jtag_tdi_i]
set_property IOSTANDARD LVCMOS18 [get_ports pad_spim_csn1]
set_property IOSTANDARD LVCMOS18 [get_ports pad_uart_rx]
set_property IOSTANDARD LVCMOS18 [get_ports pad_uart_tx]
set_property IOSTANDARD LVCMOS33 [get_ports pad_sdio_clk]
set_property IOSTANDARD LVCMOS18 [get_ports pad_sdio_cmd]
set_property IOSTANDARD LVCMOS18 [get_ports pad_sdio_data2]
set_property IOSTANDARD LVCMOS18 [get_ports pad_sdio_data3]
set_property IOSTANDARD LVCMOS18 [get_ports pad_sdio_data1]
set_property IOSTANDARD LVCMOS18 [get_ports pad_sdio_data0]
set_property IOSTANDARD LVCMOS18 [get_ports pad_i2s1_sdi]
set_property IOSTANDARD LVCMOS18 [get_ports pad_i2s0_ws]
set_property IOSTANDARD LVCMOS18 [get_ports pad_i2s0_sdi]
set_property IOSTANDARD LVCMOS18 [get_ports pad_i2s0_sck]
set_property IOSTANDARD LVCMOS18 [get_ports pad_cam_vsync]
set_property IOSTANDARD LVCMOS18 [get_ports pad_cam_pclk]
set_property IOSTANDARD LVCMOS18 [get_ports pad_cam_hsync]
set_property IOSTANDARD LVCMOS18 [get_ports pad_cam_data7]
set_property IOSTANDARD LVCMOS18 [get_ports pad_cam_data6]
set_property IOSTANDARD LVCMOS18 [get_ports pad_cam_data5]
set_property IOSTANDARD LVCMOS18 [get_ports pad_cam_data4]
set_property IOSTANDARD LVCMOS18 [get_ports pad_cam_data3]
set_property IOSTANDARD LVCMOS18 [get_ports pad_cam_data2]
set_property IOSTANDARD LVCMOS18 [get_ports pad_cam_data1]
set_property IOSTANDARD LVCMOS18 [get_ports pad_cam_data0]
set_property IOSTANDARD LVCMOS33 [get_ports cluster_jtag_tck_i]


