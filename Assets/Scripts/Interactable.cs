using UnityEngine;

public class Interactable : MonoBehaviour
{

    [SerializeField] Animator animatorImageFade;
    [SerializeField] ControllerState player;

    bool cursorShown = false;



    private void OnTriggerStay(Collider collider)
    {
        //Code executed on E pressed, while in range
        if (Input.GetKeyDown(KeyCode.E))
        {
            if (cursorShown == false)
            {
                player.FreezeController();
                Cursor.lockState = CursorLockMode.Confined;
                Cursor.visible = true;
                animatorImageFade.Play("Interaction Message FadeOut", 0, 0.0f);
                cursorShown = true;
            }
            else
            {
                player.UnFreezeController();
                DisableEverything(ref cursorShown);
                animatorImageFade.Play("Interaction Message Fade", 0, 0.0f);

            }
        }
    }

    private void OnTriggerEnter(Collider collider)
    {
        if (collider.CompareTag("Player"))
            animatorImageFade.Play("Interaction Message Fade", 0, 0.0f);
    }

    private void OnTriggerExit(Collider collider)
    {
        if (collider.CompareTag("Player"))
        {
            animatorImageFade.Play("Interaction Message FadeOut", 0, 0.0f);
            DisableEverything(ref cursorShown);
        }
    }


    private static void DisableEverything(ref bool cursorShown)
    {
        cursorShown = false;
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }
}
