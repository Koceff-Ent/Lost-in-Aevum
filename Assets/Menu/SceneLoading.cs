using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class SceneLoading : MonoBehaviour
{
    [SerializeField]
    private Image progressBar;
    // Start is called before the first frame update
    void Start()
    {
        //start async operation
        StartCoroutine(LoadAsyncOperation());

    }

    IEnumerator LoadAsyncOperation()
    {
        //create async operation
        AsyncOperation gameWorld = SceneManager.LoadSceneAsync(2);
        while (gameWorld.progress < 1)
        {
            //take progress bar fill = async operation progress.
            progressBar.fillAmount = gameWorld.progress;
            yield return new WaitForEndOfFrame();
        }
    }
}