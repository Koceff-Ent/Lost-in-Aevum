using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ControllerState : MonoBehaviour
{
    MoveController playerMovenment;
    MouseLook playerLook;
   public void FreezeController()
    {
        playerMovenment = GetComponent<MoveController>();
        playerMovenment.enabled = false;
        playerLook = GetComponentInChildren<MouseLook>();
        playerLook.enabled = false;

    }


    public void UnFreezeController()
    {
        playerMovenment = GetComponent<MoveController>();
        playerMovenment.enabled = true;
        playerLook = GetComponentInChildren<MouseLook>();
        playerLook.enabled = true;
    }
}
