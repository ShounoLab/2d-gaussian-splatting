import inspect
import datetime

class TRConf:
    datetime_enabled = True

def code_location(frame=None):
    if frame is None:
        frm = inspect.currentframe().f_back
    # frame = frm.f_back # 1-level upper of frame
    ret = f"{frame.f_code.co_filename}:{frame.f_lineno}"
    del frame
    return ret

def TR(msg=''):
    """Tracer

    Args:
        msg (str, optional): _description_. Defaults to ''.
    """
    cl = code_location(inspect.currentframe().f_back)
    ts = datetime.datetime.now() if TRConf.datetime_enabled else ""
    print(f"*TR:{ts} {cl} {msg}")

class TRMemo:
    cl_2_flag:dict[str, bool] = {}

    @classmethod
    def at1st_cl(cls, cl)->bool:
        if cl in cls.cl_2_flag:
            return False
        else:
            cls.cl_2_flag[cl] = True
            return True

def TR1(msg=''):
    """Tracer, print once

    Args:
        msg (str, optional): _description_. Defaults to ''.
    """
    cl = code_location(inspect.currentframe().f_back)
    if TRMemo.at1st_cl(cl+msg):
        ts = datetime.datetime.now() if TRConf.datetime_enabled else ""
        print(f"*TR:{ts} {cl} {msg}")
    else:
        pass
