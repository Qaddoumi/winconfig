# TODO: fix start menu pins
# Found it got the same data in %UserProfile%\AppData\Local\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState start2.bin
# $Data = @{
#         Name  = "Config"
#         Type  = "Binary"
#         Path  = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Start"
#         Value = [byte[]]@(0xe2, 0x7a, 0xe1, 0x4b, 0x01, 0xfc, 0x4d, 0x1b, 0x9c, 0x00, 0x81, 0x0b, 0xde, 0x6e, 0x51, 0x85, 0x4e, 0x5a, 0x5f, 0x47, 0x00, 0x5b, 0xb1, 0x49, 0x8a, 0x5c, 0x92, 0xaf, 0x90, 0x84, 0xf9, 0x5e, 0x4d, 0xb7, 0x6b, 0xab, 0x13, 0xeb, 0xda, 0x01, 0x40, 0x07, 0x00, 0x00, 0x5c, 0xf6, 0xee, 0x79, 0x2c, 0xdf, 0x05, 0xe1, 0xba, 0x2b, 0x63, 0x25, 0xc4, 0x1a, 0x5f, 0x10, 0xe7, 0xe4, 0x59, 0xfa, 0xa1, 0x11, 0xb3, 0x37, 0xaa, 0x52, 0x18, 0x59, 0x5c, 0x3b, 0xdc, 0x8d, 0x31, 0x7a, 0xae, 0x07, 0x69, 0xad, 0xab, 0x88, 0x4c, 0xba, 0x8f, 0x80, 0xc5, 0x4c, 0x6d, 0x26, 0x5b, 0x46, 0xc2, 0xcd, 0xfc, 0xee, 0x6e, 0x32, 0x34, 0x8b, 0x12, 0xbe, 0xa7, 0x59, 0x82, 0x30, 0xb0, 0xc2, 0x64, 0x64, 0xc9, 0xd9, 0xc9, 0x9a, 0xe1, 0x47, 0x73, 0xee, 0x81, 0x48, 0x54, 0x28, 0xe6, 0x03, 0xab, 0x0c, 0x92, 0x09, 0x8e, 0xbf, 0x08, 0xf9, 0x0b, 0xfc, 0xea, 0x33, 0xff, 0x98, 0xf6, 0x47, 0x68, 0x70, 0x59, 0x11, 0xaa, 0x73, 0xb6, 0x6c, 0x27, 0x10, 0xc5, 0x33, 0x50, 0xd6, 0xa1, 0xf8, 0xd4, 0x88, 0x68, 0xc3, 0x52, 0x7c, 0xbe, 0x63, 0xc5, 0x23, 0xa3, 0x09, 0x27, 0x41, 0x56, 0x8f, 0x61, 0xaa, 0x34, 0x3c, 0x2e, 0x1b, 0xca, 0x02, 0x84, 0x6d, 0xe6, 0x6a, 0x0a, 0xa4, 0x6f, 0x4a, 0x03, 0xda, 0x95, 0x27, 0x39, 0xdc, 0xe1, 0x6a, 0x0a, 0x1d, 0x85, 0x1f, 0x27, 0x73, 0x97, 0x4f, 0x5f, 0x0a, 0x16, 0xa8, 0xb3, 0x7f, 0x39, 0x42, 0xf1, 0x78, 0xd0, 0x40, 0xc4, 0x81, 0x23, 0xbc, 0x53, 0xdf, 0xdd, 0x9e, 0xd0, 0x1e, 0x35, 0x42, 0xf0, 0xba, 0xe6, 0x41, 0x8b, 0xb0, 0x64, 0x59, 0x22, 0x0e, 0x99, 0x63, 0x75, 0x97, 0x87, 0xbe, 0x4d, 0x96, 0xed, 0x48, 0x95, 0xf0, 0x9f, 0xe1, 0x08, 0x34, 0x02, 0x61, 0x44, 0x7c, 0x82, 0x48, 0xd7, 0xa4, 0xbb, 0x6d, 0x5d, 0xb3, 0x0f, 0x9c, 0x32, 0x82, 0xe8, 0xac, 0xc2, 0xa7, 0x46, 0x68, 0x49, 0x30, 0xbb, 0xc4, 0xf8, 0x20, 0x9d, 0x80, 0xd2, 0x88, 0x68, 0xfa, 0x3f, 0x2a, 0xb8, 0xb3, 0xbd, 0xad, 0x7e, 0x6c, 0xcb, 0x08, 0xf1, 0xb4, 0xa4, 0x57, 0xf0, 0xb1, 0x68, 0x24, 0xcb, 0x5e, 0x87, 0x5b, 0xfc, 0xdb, 0x81, 0x60, 0x2b, 0x08, 0x1d, 0x8d, 0x6c, 0x4e, 0xf6, 0xf0, 0x48, 0x14, 0x4d, 0x30, 0xfb, 0xdc, 0x73, 0x0e, 0x37, 0x44, 0x90, 0x94, 0x29, 0x94, 0x64, 0x04, 0xb9, 0x02, 0x55, 0xf5, 0xb6, 0xe0, 0x03, 0x5b, 0x2d, 0xf1, 0xd7, 0xa1, 0xf1, 0xc3, 0x30, 0xbc, 0x71, 0x14, 0xd5, 0x29, 0x04, 0xf4, 0xa0, 0xcc, 0x61, 0xe7, 0xb9, 0xe1, 0xe4, 0x9c, 0x40, 0x9c, 0x7f, 0xa2, 0x78, 0x1c, 0x21, 0x41, 0xab, 0x3b, 0xd2, 0x1f, 0x54, 0xe3, 0x43, 0x74, 0xba, 0x27, 0xcb, 0x6a, 0xdb, 0x26, 0x90, 0xfa, 0x31, 0x4d, 0x93, 0x11, 0x91, 0x32, 0xeb, 0x21, 0x75, 0x73, 0x4d, 0x89, 0x33, 0x63, 0x0c, 0x56, 0x0c, 0x24, 0xdb, 0xe0, 0x44, 0xbd, 0xa5, 0xbb, 0xad, 0xcd, 0x3c, 0x4f, 0x82, 0xc7, 0x2f, 0x88, 0x28, 0x2d, 0x4d, 0x74, 0xa2, 0xf0, 0x78, 0x57, 0x4e, 0x19, 0x9a, 0xf6, 0xcb, 0x52, 0xb6, 0x22, 0x47, 0x5e, 0x7e, 0x63, 0x7d, 0x70, 0xb6, 0x50, 0xfc, 0x25, 0x57, 0x93, 0x0f, 0x10, 0xc3, 0x69, 0xce, 0xaf, 0xf9, 0xed, 0xc2, 0xe1, 0x55, 0xfe, 0xdb, 0xc9, 0xa0, 0xf5, 0xb6, 0x10, 0xec, 0xd1, 0x98, 0x5d, 0x97, 0x3b, 0xc9, 0x90, 0x0d, 0x0b, 0xf9, 0xd6, 0x4e, 0x7f, 0xbf, 0x86, 0x44, 0xd9, 0x52, 0xf4, 0x74, 0x82, 0x2f, 0x8f, 0x53, 0x3e, 0x28, 0xfc, 0x34, 0x9d, 0x2b, 0x36, 0xef, 0x54, 0x20, 0x25, 0xa9, 0xd8, 0xc0, 0xad, 0xc2, 0xa4, 0x59, 0x6e, 0x2b, 0xfd, 0x62, 0x94, 0x48, 0xbb, 0x24, 0xa0, 0xe2, 0x91, 0x3f, 0x17, 0x4d, 0x2c, 0xf5, 0x41, 0x97, 0x64, 0xba, 0x6e, 0x58, 0xde, 0xe0, 0xbb, 0xc1, 0xce, 0xe9, 0x69, 0x78, 0x75, 0xae, 0x6d, 0x6b, 0x4e, 0x8f, 0x4e, 0x60, 0xbe, 0xa2, 0x9a, 0x86, 0xaf, 0x1b, 0x1e, 0x95, 0x26, 0xa6, 0x67, 0xd5, 0xd4, 0x39, 0xbe, 0x1d, 0x04, 0x76, 0x9f, 0x89, 0x0f, 0x6f, 0x58, 0xd2, 0xe6, 0x20, 0x79, 0x0e, 0x59, 0x70, 0x7c, 0x97, 0xbc, 0x9a, 0x6f, 0x4d, 0x56, 0xaa, 0x1f, 0x3d, 0xb2, 0xb4, 0xd7, 0x64, 0x28, 0xc9, 0xe3, 0x18, 0x10, 0x39, 0xd3, 0x7f, 0x29, 0x92, 0xb6, 0x6c, 0x5b, 0x94, 0xdf, 0xd0, 0x72, 0x8c, 0x3a, 0x0e, 0x50, 0xc7, 0x7b, 0x85, 0xa5, 0x21, 0x27, 0x70, 0x27, 0x65, 0xaf, 0x50, 0xc8, 0x11, 0x36, 0xa7, 0xe6, 0x4e, 0x10, 0xbe, 0x29, 0xf7, 0xe0, 0x43, 0xd5, 0x56, 0x86, 0xd2, 0xf3, 0x83, 0x85, 0x49, 0x7d, 0xd8, 0xd3, 0x13, 0xa9, 0x97, 0x5e, 0x07, 0x87, 0xf5, 0x3a, 0x9e, 0x6a, 0xe0, 0x7b, 0x63, 0xc9, 0x46, 0xf8, 0x28, 0xe2, 0x46, 0x41, 0xd6, 0x77, 0x49, 0x0e, 0x14, 0x42, 0xda, 0x57, 0x24, 0x72, 0x88, 0x4e, 0x7b, 0x88, 0xa8, 0x7c, 0x0b, 0x6d, 0xce, 0xb4, 0x67, 0x36, 0x18, 0x1b, 0xff, 0x75, 0x22, 0xda, 0x15, 0x23, 0xef, 0x48, 0x9f, 0x56, 0x20, 0xbf, 0x04, 0xed, 0x16, 0x59, 0x2b, 0x8b, 0x11, 0x0a, 0xa5, 0x54, 0xb9, 0xb6, 0x1a, 0x17, 0x27, 0xad, 0x85, 0xb2, 0xad, 0x24, 0x98, 0x30, 0x67, 0xbb, 0xe7, 0xa1, 0x0e, 0xa4, 0x62, 0xaf, 0xdf, 0x9d, 0xb6, 0xb9, 0xad, 0x88, 0xcd, 0x41, 0xfe, 0x7d, 0x92, 0x49, 0xb5, 0x1a, 0x1b, 0xd3, 0xf9, 0x8f, 0x7b, 0x5d, 0x01, 0x30, 0xc4, 0x8e, 0xa2, 0xc1, 0x92, 0xab, 0x12, 0x3c, 0x95, 0xc8, 0x48, 0x64, 0x74, 0x4c, 0xba, 0x9f, 0xd7, 0x65, 0x9e, 0xe8, 0xb4, 0x1c, 0x99, 0x14, 0x4a, 0xf3, 0x1d, 0xcf, 0x9d, 0x02, 0xda, 0x51, 0x4e, 0xbf, 0x52, 0x6c, 0xea, 0x5b, 0xfa, 0xc2, 0xe7, 0xe9, 0x3d, 0x27, 0x32, 0x26, 0x9d, 0x6e, 0xd3, 0x77, 0xd7, 0x7e, 0x64, 0x3f, 0x4a, 0x68, 0xe1, 0xf5, 0xf0, 0x2f, 0x83, 0xa0, 0x17, 0x3b, 0x39, 0xfb, 0x5b, 0xa0, 0x33, 0xbf, 0xef, 0x4d, 0x18, 0x0a, 0xe1, 0x05, 0x90, 0xc9, 0x05, 0x77, 0xaf, 0x83, 0x33, 0x4e, 0xb1, 0x1b, 0x8a, 0xfc, 0x31, 0xcf, 0x66, 0x29, 0xac, 0xe8, 0x37, 0xa9, 0xc0, 0x85, 0x7f, 0xee, 0x4f, 0x96, 0xfe, 0x5d, 0x2d, 0x8f, 0xca, 0xc4, 0x4e, 0xdc, 0x95, 0xa4, 0x2f, 0x1c, 0xfb, 0x40, 0x64, 0x5b, 0xff, 0x21, 0x99, 0xa6, 0x7d, 0xe3, 0xcc, 0x37, 0xab, 0xf6, 0xdd, 0x72, 0x58, 0xd2, 0x1a, 0x75, 0x9f, 0x90, 0x76, 0x4c, 0x81, 0x4c, 0xd3, 0x4b, 0xbd, 0x95, 0x98, 0x7a, 0x52, 0x77, 0xcb, 0xb6, 0x7b, 0x69, 0xa7, 0xf6, 0xbd, 0x7d, 0x9b, 0x4e, 0x32, 0x76, 0x8b, 0x20, 0x93, 0x0a, 0x82, 0x91, 0x04, 0x02, 0x1d, 0xf6, 0xa4, 0x6a, 0x37, 0xfe, 0x48, 0xfc, 0x89, 0xec, 0x2a, 0x2c, 0x15, 0xbf, 0x48, 0x6e, 0x93, 0x09, 0xc0, 0x70, 0x76, 0x4f, 0xbe, 0x2a, 0xb9, 0xf3, 0x7e, 0x4a, 0x26, 0x1c, 0x02, 0xed, 0xda, 0x6f, 0x09, 0x96, 0x94, 0xd7, 0x31, 0x23, 0x88, 0x6a, 0x06, 0x0a, 0x0d, 0xd9, 0xb0, 0x19, 0x5e, 0xe3, 0xaf, 0x5b, 0x6b, 0xf2, 0x2f, 0x08, 0xc6, 0xae, 0xc8, 0xe2, 0x42, 0x10, 0xca, 0x40, 0x36, 0xb8, 0x84, 0x7a, 0x42, 0xe5, 0x58, 0x29, 0x5d, 0x8f, 0x35, 0x1d, 0x96, 0x2e, 0x9a, 0xf0, 0x3e, 0xf2, 0x24, 0x37, 0xf7, 0xda, 0x29, 0x64, 0xf6, 0xc1, 0xd9, 0xa0, 0x33, 0x4d, 0x57, 0x36, 0xc8, 0x57, 0x08, 0x46, 0x60, 0x42, 0x64, 0xf9, 0x58, 0x10, 0x8c, 0x0b, 0x08, 0x5e, 0xb6, 0xc4, 0xbd, 0x58, 0x73, 0xfa, 0x50, 0x74, 0x06, 0xb9, 0x12, 0xeb, 0x81, 0x32, 0x2d, 0x82, 0x10, 0xb7, 0xfe, 0x67, 0x4c, 0x3b, 0x31, 0xb1, 0xf1, 0x58, 0x33, 0x78, 0xb0, 0xe5, 0x26, 0xdc, 0x03, 0xd5, 0xe4, 0x9f, 0x46, 0x4f, 0xc5, 0x2c, 0x27, 0x66, 0x2c, 0xd9, 0xd4, 0x21, 0xf4, 0xff, 0x56, 0xc4, 0xfb, 0x3d, 0x74, 0xb9, 0x4f, 0x88, 0xc7, 0x10, 0xc6, 0xcc, 0xdf, 0x73, 0xfc, 0xce, 0x50, 0xa0, 0xe1, 0xaa, 0x43, 0x45, 0x82, 0x3b, 0x7c, 0xf4, 0xaa, 0x15, 0x52, 0xdf, 0x27, 0x27, 0x14, 0x03, 0x0b, 0xf9, 0x2d, 0xb0, 0x7f, 0x81, 0x90, 0xe9, 0x18, 0xab, 0xcd, 0x27, 0x68, 0xe9, 0xf8, 0x51, 0x8e, 0x3c, 0x60, 0x66, 0x77, 0xbf, 0xca, 0xc6, 0x69, 0x3f, 0x1e, 0xc6, 0x46, 0x5d, 0xe2, 0x2a, 0x9b, 0xb6, 0x9c, 0x84, 0x24, 0x46, 0x73, 0xee, 0x77, 0xc0, 0x77, 0xe4, 0xa7, 0x16, 0xcd, 0x91, 0x91, 0x31, 0x0a, 0xa1, 0x4d, 0x7b, 0x2d, 0x68, 0xf2, 0xbc, 0x99, 0x81, 0x2d, 0x62, 0xe8, 0xca, 0x33, 0xe5, 0x92, 0xd3, 0x23, 0x2b, 0x04, 0x00, 0xf7, 0xfe, 0x99, 0x11, 0x13, 0x8e, 0xa5, 0x16, 0x0b, 0xa9, 0x06, 0x96, 0x5c, 0xf9, 0x77, 0x69, 0x9e, 0x59, 0x2d, 0x36, 0xed, 0x2d, 0xc9, 0x4e, 0xbd, 0x5e, 0xd7, 0x39, 0xeb, 0x6c, 0x5b, 0x9b, 0x4e, 0x2b, 0xbd, 0x99, 0x22, 0x1c, 0x6e, 0xfb, 0x68, 0x1e, 0xd4, 0x51, 0x61, 0x4a, 0x1e, 0xbe, 0x13, 0x38, 0x80, 0x4b, 0x8a, 0x4b, 0x18, 0x75, 0x3a, 0x70, 0x34, 0xc5, 0x3c, 0xf5, 0xe3, 0x60, 0xa3, 0x64, 0x0b, 0xb4, 0x36, 0x8e, 0x40, 0x2e, 0x19, 0x5f, 0xff, 0x42, 0xa9, 0x1a, 0xf0, 0x73, 0x33, 0xff, 0xa1, 0xfb, 0x33, 0x4a, 0xc5, 0x4c, 0x1a, 0x6e, 0x6f, 0x3c, 0x6d, 0xd0, 0x79, 0xe3, 0xc6, 0x5b, 0xf6, 0xfe, 0x9a, 0xfc, 0x6e, 0x6f, 0x32, 0x1b, 0xbc, 0xf7, 0x3f, 0x13, 0x7a, 0x65, 0x6d, 0x39, 0x8f, 0x71, 0x06, 0x0a, 0xab, 0xdc, 0xd7, 0x13, 0x8c, 0x07, 0x61, 0xa9, 0x43, 0x22, 0x05, 0xd5, 0x61, 0xad, 0x0c, 0x21, 0x0e, 0x4a, 0x02, 0x2e, 0xe4, 0x54, 0x5d, 0xe3, 0x4b, 0xae, 0xbc, 0xe1, 0x2c, 0xd5, 0xbf, 0xcc, 0x01, 0x59, 0x14, 0x6e, 0x14, 0x92, 0x08, 0x8f, 0xfe, 0xe8, 0x4c, 0x55, 0x0c, 0xaf, 0xa0, 0xce, 0xb9, 0xad, 0xf0, 0x4d, 0x98, 0x5e, 0x88, 0x27, 0x0e, 0x77, 0xd4, 0x63, 0x06, 0xf9, 0x24, 0xc7, 0x5c, 0xfc, 0x94, 0x84, 0x8e, 0xc8, 0xcb, 0x48, 0x6b, 0xdb, 0xba, 0x3f, 0x6c, 0x0b, 0x70, 0x68, 0xec, 0x64, 0x4e, 0xe5, 0x99, 0xc2, 0x68, 0x50, 0x45, 0x12, 0x83, 0xfc, 0xb7, 0x68, 0x5b, 0x74, 0xb9, 0xaa, 0x8b, 0x99, 0x2d, 0x2b, 0x37, 0x3e, 0x46, 0x0f, 0x8c, 0xc7, 0x8e, 0x52, 0x08, 0xae, 0x63, 0xe1, 0x3b, 0x90, 0x77, 0x44, 0x33, 0x8d, 0x66, 0xac, 0xbb, 0x08, 0xaf, 0xb7, 0xbf, 0x06, 0xd0, 0x9c, 0xa3, 0x40, 0x41, 0xc5, 0x7d, 0x6a, 0xba, 0xeb, 0x56, 0xf7, 0x6b, 0xec, 0x2e, 0x51, 0xb7, 0xa7, 0x3d, 0xcd, 0xbf, 0xdb, 0x5a, 0xb5, 0xb8, 0xd2, 0x03, 0x49, 0x86, 0x0b, 0xa4, 0x78, 0x8c, 0x54, 0x76, 0xcf, 0xff, 0x34, 0xfb, 0xdb, 0xf1, 0xb2, 0x40, 0xf7, 0x9a, 0x43, 0xb0, 0xfd, 0x20, 0x09, 0xf5, 0x06, 0xf3, 0x30, 0x69, 0x09, 0x1e, 0x31, 0xab, 0xa9, 0xac, 0x94, 0x98, 0xbf, 0xf7, 0x0a, 0x2f, 0xcc, 0x24, 0x06, 0x6d, 0xd9, 0xd0, 0x3b, 0x3c, 0xa1, 0x06, 0x01, 0x65, 0x94, 0x5e, 0xb2, 0xd3, 0xbc, 0xad, 0xfe, 0xab, 0x60, 0x45, 0x99, 0xaf, 0x26, 0xdc, 0x4b, 0xa3, 0x4a, 0x56, 0x9f, 0x32, 0x36, 0x68, 0xd3, 0x1f, 0x62, 0xec, 0x2e, 0x64, 0xd8, 0xe9, 0x91, 0xac, 0xc4, 0x30, 0x32, 0x76, 0x7f, 0x6c, 0x8f, 0x28, 0x41, 0x3a, 0x89, 0x20, 0xfc, 0x2f, 0x4a, 0x0a, 0x3e, 0x6a, 0x43, 0xf4, 0x68, 0x01, 0x5e, 0x99, 0x09, 0xfe, 0x06, 0xbd, 0x47, 0xdf, 0x9a, 0x01, 0xe5, 0x0a, 0xdb, 0x9a, 0xe8, 0x76, 0x2b, 0xdf, 0x8e, 0x3e, 0x15, 0x57, 0x5a, 0x6e, 0x7c, 0xe5, 0x48, 0x22, 0x5e, 0x50, 0x59, 0x51, 0x1e, 0x39, 0x9a, 0xe2, 0x32, 0xed, 0x98, 0xc8, 0xd3, 0xf7, 0x02, 0x59, 0x36, 0xd4, 0x1a, 0xd9, 0x0c, 0xba, 0x98, 0xf6, 0xcb, 0x63, 0xbc, 0x94, 0x22, 0x74, 0x8d, 0xed, 0x4d, 0x41, 0x4e, 0x60, 0xcd, 0x24, 0xaa, 0xe8, 0x95, 0xb8, 0xf3, 0x01, 0x15, 0xb1, 0xa7, 0x1c, 0x6a, 0x95, 0x91, 0xac, 0xec, 0x77, 0x49, 0x04, 0xcd, 0x11, 0x3b, 0x85, 0x62, 0x62, 0x9b, 0x6d, 0x6b, 0xca, 0x7d, 0xb3, 0x01, 0x23, 0xb1, 0x7f, 0x23, 0x98, 0x9c, 0xc9, 0xc6, 0x6d, 0xc7, 0xaf, 0x9c, 0xfc, 0xfd, 0x0f, 0x9e, 0x6b, 0xee, 0x2d, 0x64, 0x3f, 0xb2, 0x18, 0xcb, 0x9f, 0x39, 0xfc, 0xd1, 0xd2, 0x6d, 0x23, 0xa9, 0x44, 0x1a, 0xf8, 0xd4, 0x45, 0x85, 0x4f, 0xcb, 0x3a, 0x60, 0x15, 0x47, 0xe0, 0xe5, 0x19, 0x2f, 0xa7, 0xc7, 0x07, 0x21, 0x48, 0x4e, 0x4f, 0xe5, 0xcb, 0xe3, 0xca, 0x18, 0xaa, 0x73, 0x95, 0x64, 0x86, 0xfa, 0x8a, 0x3a, 0xd1, 0x93, 0xf6, 0x81, 0x0c, 0xa8, 0x96, 0xb5, 0x6e, 0x5f, 0x06, 0x8d, 0x66, 0x51, 0xe6, 0x7d, 0x44, 0x65, 0xe3, 0x13, 0x11, 0x29, 0xfc, 0xcc, 0xdc, 0xef, 0x34, 0x81, 0xf4, 0x73, 0x97, 0x3e, 0x82, 0x26, 0x13, 0xff, 0x99, 0xc7, 0x25, 0xcd, 0xeb, 0x99, 0x09, 0xf0, 0x9a, 0xf8, 0xc0, 0xae, 0x8e, 0x18, 0x39, 0x56, 0x97, 0x36, 0x35, 0x2d, 0x1f, 0x9f, 0xa0, 0xa9, 0x1e, 0xc8, 0x38, 0xea, 0xd2, 0x4a, 0x80, 0xa3, 0x44, 0x72, 0x43, 0x8f, 0x86, 0x28, 0xa8, 0xae, 0xe8, 0xd3, 0x5b, 0x7d, 0x3c, 0xbe, 0x37, 0xf3, 0x11, 0xc4, 0xd1, 0x28, 0xc7, 0x79, 0xa8, 0x8e, 0xd4, 0x57, 0x8b, 0xc4, 0x4a, 0x5f, 0x61, 0x52, 0x76, 0xc9, 0x27, 0xbc, 0xad, 0xd5, 0x2c, 0xa0, 0x98, 0xd0, 0xac, 0xff, 0xc5, 0x1d, 0x12, 0x04, 0x9b, 0x69, 0xf0, 0xbc, 0x14, 0x42, 0xd0, 0xce, 0x25, 0x4a, 0x50, 0x6e, 0x16, 0xf2, 0x90, 0x84, 0xb9, 0x74, 0x0d, 0xe7, 0xa0, 0x3d, 0x15, 0xad, 0x78, 0xb3, 0x2e, 0x7e, 0xc6, 0x0d, 0x29, 0x90, 0x7a, 0x7a, 0x61, 0xf5, 0xaf, 0x5b, 0xcf, 0x04, 0x75, 0x9f, 0x09, 0x6e, 0x08, 0x2e, 0xe3, 0x88)
# }
# Write-Host "Settings Start menu pins" -ForegroundColor Green
# Set-Registry -Name $Data.Name -Path $Data.Path -Type $Data.Type -Value $Data.Value

# Write-Host "Settings start2.bin file" -ForegroundColor Cyan
# $FilePath = "$($ENV:USERPROFILE)\AppData\Local\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState\start2.bin"
# [System.IO.File]::WriteAllBytes($FilePath, $Data.Value)

# To get the LayoutModification using powershell 'Export-StartLayout -Path ".\LayoutModification.json"'
#       $LayoutModificationJSON = '{"pinnedList":[{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Microsoft Edge.lnk"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Word.lnk"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Excel.lnk"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\PowerPoint.lnk"},{"packagedAppId":"windows.immersivecontrolpanel_cw5n1h2txyewy!microsoft.windows.immersivecontrolpanel"},{"desktopAppLink":"%APPDATA%\\Microsoft\\Windows\\Start Menu\\Programs\\Recycle Bin.lnk"},{"packagedAppId":"Microsoft.OutlookforWindows_8wekyb3d8bbwe!Microsoft.OutlookforWindows"},{"packagedAppId":"Microsoft.WindowsStore_8wekyb3d8bbwe!App"},{"packagedAppId":"Microsoft.Windows.Photos_8wekyb3d8bbwe!App"},{"packagedAppId":"Microsoft.GamingApp_8wekyb3d8bbwe!Microsoft.Xbox.App"},{"packagedAppId":"Clipchamp.Clipchamp_yxz26nhyzhsrt!App"},{"packagedAppId":"Microsoft.Todos_8wekyb3d8bbwe!App"},{"packagedAppId":"Microsoft.WindowsCalculator_8wekyb3d8bbwe!App"},{"packagedAppId":"Microsoft.WindowsAlarms_8wekyb3d8bbwe!App"},{"packagedAppId":"Microsoft.WindowsNotepad_8wekyb3d8bbwe!App"},{"packagedAppId":"Microsoft.Paint_8wekyb3d8bbwe!App"},{"packagedAppId":"Microsoft.ScreenSketch_8wekyb3d8bbwe!App"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\OneNote.lnk"},{"desktopAppLink":"%APPDATA%\\Microsoft\\Windows\\Start Menu\\Programs\\System Tools\\Control Panel.lnk"},{"packagedAppId":"Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe!App"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Macrium\\Reflect\\Macrium Reflect.lnk"},{"packagedAppId":"4789ZeroByte.NetSpeedMeter_gvheqymwk6zrr!App"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\NVIDIA Corporation\\GeForce Experience.lnk"},{"packagedAppId":"Microsoft.WindowsTerminal_8wekyb3d8bbwe!App"},{"packagedAppId":"Microsoft.WindowsSoundRecorder_8wekyb3d8bbwe!App"},{"packagedAppId":"Microsoft.BingWeather_8wekyb3d8bbwe!App"},{"packagedAppId":"Microsoft.WindowsScan_8wekyb3d8bbwe!App"},{"packagedAppId":"Microsoft.Whiteboard_8wekyb3d8bbwe!Whiteboard"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Google Chrome.lnk"},{"desktopAppLink":"%APPDATA%\\Microsoft\\Windows\\Start Menu\\Programs\\Chrome Apps\\Chrome Remote Desktop.lnk"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Google Drive.lnk"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Firefox.lnk"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Git\\Git GUI.lnk"},{"desktopAppLink":"%APPDATA%\\Microsoft\\Windows\\Start Menu\\Programs\\Visual Studio Code\\Visual Studio Code.lnk"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Visual Studio 2022.lnk"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Visual Studio Installer.lnk"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\VMware\\VMware Workstation Pro.lnk"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\VMware\\VMware Workstation 17 Player.lnk"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\VMware\\Virtual Network Editor.lnk"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\LibreOffice 24.2\\LibreOffice.lnk"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\LibreOffice 24.2\\LibreOffice Writer.lnk"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\LibreOffice 24.2\\LibreOffice Calc.lnk"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\LibreOffice 24.2\\LibreOffice Draw.lnk"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\ONLYOFFICE\\ONLYOFFICE Editors.lnk"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\ONLYOFFICE\\New spreadsheet.lnk"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\ONLYOFFICE\\New PDF Form.lnk"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\ONLYOFFICE\\New document.lnk"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\PDFtk - The PDF Toolkit\\PDFtk - The PDF Toolkit.lnk"},{"desktopAppLink":"%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\NAPS2\\NAPS2.lnk"},{"desktopAppLink":"%APPDATA%\\Microsoft\\Windows\\Start Menu\\Programs\\procmon.lnk"}]}'
# Application User Model ID AUMID "Get-StartApps"
# To Get AUMID to use in StartLayout
<#
        $installedapps = Get-AppxPackage
        $aumidList = @()
        foreach ($app in $installedapps){
                foreach ($id in (Get-AppxPackageManifest $app).package.applications.application.id){
                        $aumidList += $app.packagefamilyname + "!" + $id
                }
        }
        $aumidList
#>

# [System.IO.FileInfo]$start_layout = "..\ProgramsConfigFiles\StartMenuPins\start2.bin"

# ls "C:\Users\" -Attributes Directory -Force | ? { $_.FullName -notin $env:PUBLIC -and $_.Name -notin "All Users", "Default User" } | % {

#         [System.IO.DirectoryInfo]$destination = "$($_.FullName)\AppData\Local\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState"

#         if (!$destination.Exists) {
#                 $destination.Create()
#         }

#         $start_layout.CopyTo("$($destination)\start2.bin", $true)
# }


# Define the app name to unpin
$appName = "Microsoft Edge"

# Get the shell object
$shell = New-Object -ComObject Shell.Application

# Get the Start menu folder
$startFolder = $shell.NameSpace('Shell:StartMenu')

# Iterate over the items in the Start menu
foreach ($item in $startFolder.Items()) {
        if ($item.Name -eq $appName) {
                # Invoke the unpin action
                $verb = $item.Verbs() | Where-Object { $_.Name -eq 'Unpin from Start' }
                if ($verb) {
                        $verb.DoIt()
                        Write-Host "$appName has been unpinned from the Start menu."
                }
                else {
                        Write-Host "$appName is not pinned to the Start menu."
                }
        }
}
