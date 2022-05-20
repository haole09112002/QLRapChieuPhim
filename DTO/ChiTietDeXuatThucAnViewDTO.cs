﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class ChiTietDeXuatThucAnViewDTO
    {
        private string maDeXuat;
        private string maThucAn;
        private string tenThucAn;
        private int soLuong;
        private string donViTinh;

        public string MaDeXuat { get => maDeXuat; set => maDeXuat = value; }
        public string MaThucAn { get => maThucAn; set => maThucAn = value; }
        public string TenThucAn { get => tenThucAn; set => tenThucAn = value; }
        public int SoLuong { get => soLuong; set => soLuong = value; }
        public string DonViTinh { get => donViTinh; set => donViTinh = value; }
    }
}
