﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace AppServicesPoc.Controllers
{
    public class ValuesController : ApiController
    {
        // GET values/5
        public string Get(int  id)
        {
            return id.ToString();
        }
    }
}
